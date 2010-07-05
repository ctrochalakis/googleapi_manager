require 'rails'

module GoogleApiManager
    
  class Railtie < Rails::Railtie
    initializer :after_initialize do
      ActionView::Base.send :include, GoogleApiManager::ApiKeyHelper
    end
  end
  
  class GoogleAPIKeyConfigFileNotFoundException < StandardError; end
  class AmbiguousGoogleAPIKeyException < StandardError; end
  
  module ApiKey
    extend self

    def google_api_key
      config_file = File.join(Rails.root, 'config', 'google_api_keys.yml')
      unless File.exist? config_file
        raise GoogleAPIKeyConfigFileNotFoundException.new("File #{config_file} not found")
      else
        YAML.load_file(config_file)[Rails.env]
      end
    end

    def get(options = {})
      if options.has_key?(:key)
        options[:key]
      elsif google_api_key.is_a?(Hash)
        #For this environment, multiple hosts are possible.
        #:host must have been passed as option
        if options.has_key?(:host)
          google_api_key[options[:host]]
        else
          raise AmbiguousGoogleAPIKeyException.new(google_api_key.keys.join(","))
        end
      else
        google_api_key
      end
    end
    
  end

  module ApiKeyHelper
    def google_api_js(options={})
      key = GoogleApiManager::ApiKey.get(options)
      html = <<-HTML
      <script type="text/javascript" src="http://www.google.com/jsapi?key=#{key}">
      </script>
      HTML
      html.html_safe
    end
  end

end
