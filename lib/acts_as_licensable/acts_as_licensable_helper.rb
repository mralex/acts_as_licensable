module ActsAsLicensable
  module Helper
    def link_to_license(licensable, options = {}, html_options = {})
      if options[:short_license] == true
        title = licensable.license.short_name
      else
        title = licensable.license.name
      end
      
      if options[:without_version].nil?
        title += " " + licensable.license.version
      end
      
      link_to(title, licensable.license.url, options, html_options)
    end
  end
end