Gem::Specification.new do |s|
  s.name = 'abstractifier'
  s.version = '1.0.0'
  s.summary = 'A small library to generate abstracts from text.'
  s.description = <<-EOF
    Simple abstract generation library for Ruby.
  EOF
  s.license = 'MIT'
  s.authors = ['Matthew MacLeod']
  s.email = 'support@altmetric.com'
  s.homepage = 'https://github.com/altmetric/abstractifier'
  s.files = %w(README.md LICENSE lib/abstractifier.rb)
  s.test_files = Dir['spec/**/*.rb']
  s.require_paths = ['lib']

  s.add_development_dependency('rake')
  s.add_development_dependency('rspec')
end
