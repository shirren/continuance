$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'continuance/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'continuance'
  s.version     = Continuance::VERSION
  s.authors     = ['Shirren Premaratne']
  s.email       = ['shirren.premaratne@gmail.com']
  s.homepage    = 'https://github.com/shirren/continuance'
  s.summary     = 'Continuance is a library for handling durations as opposed to time.'
  s.description = 'Continuance is a library for handling durations as opposed to time. ' +
                  'A duration represents a finite period of time meaurable in hours, minutes, ' +
                  'seconds and nanoseconds.'

  s.files = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']
end
