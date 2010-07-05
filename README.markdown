GoogleapiManager
================

Manage your google api keys for different hosts.
Rails 3 only.


Install
-------

    # Gemfile
    source 'http://rubygems.org'
    gem 'googleapi_manager'


Usage
-----
    # sample config/google_api_keys.yml
    # read the source for alternative config files
    development:
     ABQIAAA....
    test:
     ABQIAAA....
    production:
     skroutz.gr: ABQIAAAA...
     merchants.skroutz.gr: ABQIAAAA...
    
    # template.erb
    <%= google_api_js :host => request.host %>
    # outputs:
    <script type="text/javascript" src="http://www.google.com/jsapi?key=<key>"></script>
