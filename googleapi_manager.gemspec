Gem::Specification.new do |s|
  s.name              = "googleapi_manager"
  s.version           = '0.0.1'
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "Rails 3 helper for managing google api keys."
  s.homepage          = "http://github.com/ctrochalakis/googleapi_manager"
  s.email             = "yatiohi@ideopolis.gr"
  s.authors           = [ "Christos Trochalakis" ]
  s.has_rdoc          = false

  s.files             = %w( README.markdown Rakefile MIT-LICENSE )
  s.files            += Dir.glob("lib/**/*")

  s.description       = <<desc
  Manage your google api keys for various hosts. Rails 3 only.
desc
end
