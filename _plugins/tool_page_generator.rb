# Generate pages from individual records in yml files
# (c) 2014-2016 Adolfo Villafiorita
# Distributed under the conditions of the MIT License
# Edited 2017 by Ammon Shepherd

module Jekyll

  module Sanitizer
    # strip characters and whitespace to create valid filenames, also lowercase
    def sanitize_filename(name)
      if(name.is_a? Integer)
        return name.to_s
      end
      return name.to_s.downcase.strip.gsub(' ', '-').gsub(/[^\w.-]/, '')
    end
  end

  # this class is used to tell Jekyll to generate a page
  class ToolPage < Page
    include Sanitizer

    # - site and base are copied from other plugins: to be honest, I am not sure what they do
    #
    # - `index_files` specifies if we want to generate named folders (true) or not (false)
    # - `dir` is the default output directory
    # - `data` is the data defined in `_data.yml` of the record for which we are generating a page
    # - `filename` is the key in `data` which determines the output filename
    # - `template` is the name of the template for generating the page
    # - `extension` is the extension for the generated file
    def initialize(site, base, index_files, dir, data, filename, template, extension)
      @site = site
      @base = base

      # @dir is the directory where we want to output the page
      # @filename is the name of the page to generate
      #
      # the value of these variables changes according to whether we
      # want to generate named folders or not
      the_filename = sanitize_filename(data[filename]).to_s
      if index_files
        @dir = dir + (index_files ? "/" + the_filename + "/" : "")
        @filename =  "index" + "." + extension.to_s
      else
        @dir = dir
        @filename = the_filename + "." + extension.to_s
      end

      self.process(@filename)
      self.read_yaml(File.join(base, '_layouts'), template + ".html")
      self.data['title'] = data[filename]
      # add all the information defined in _data for the current record to the
      # current page (so that we can access it with liquid tags)
      self.data.merge!(data)
    end
  end

  class ToolPagesGenerator < Generator
    safe true

    # generate loops over _config.yml/tool_page invoking the ToolPage
    # constructor for each record for which we want to generate a page

    def generate(site)
      # tool_page_dirs determines whether we want to generate index pages
      # (filename/index.html) or standard files (filename.html). This information
      # is passed to the ToolPage constructor, which sets the @dir variable
      # as required by this directive
      index_files = site.config['tool_page-dirs'] == true

      # data contains the specification of the data for which we want to generate
      # the pages (look at the README file for its specification)
      data = site.config['tool_page']
      if data
        data.each do |data_spec|
          template = data_spec['template'] || data_spec['data']
          filename = data_spec['filename']
          dir = data_spec['dir'] || data_spec['data']
          extension = data_spec['extension'] || "html"

          if site.layouts.key? template
            # records is the list of records defined in _data.yml
            # for which we want to generate different pages
            records = nil
            data_spec['data'].split('.').each do |level|
              if records.nil?
                records = site.data[level]
              else
                records = records[level]
              end
            end
            records.each do |record|
              site.pages << ToolPage.new(site, site.source, index_files, dir, record, filename, template, extension)
            end
          else
            puts "error. could not find template #{template}" if not site.layouts.key? template
          end
        end
      end
    end
  end

  module ToolPageLinkGenerator
    include Sanitizer

    # use it like this: {{input | toolpage_url: dir}}
    # to generate a link to a data_page.
    #
    # the filter is smart enough to generate different link styles
    # according to the data_page-dirs directive ...
    #
    # ... however, the filter is not smart enough to support different
    # extensions for filenames.
    #
    # Thus, if you use the `extension` feature of this plugin, you
    # need to generate the links by hand
    def toolpage_url(input, dir)
      @gen_dir = Jekyll.configuration({})['tool_page-dirs']
      if @gen_dir then
        dir + "/" + sanitize_filename(input) + "/index.html"
      else
        dir + "/" + sanitize_filename(input) + ".html"
      end
    end
  end

end

Liquid::Template.register_filter(Jekyll::ToolPageLinkGenerator)

