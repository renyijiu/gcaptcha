lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gcaptcha/version"

Gem::Specification.new do |spec|
  spec.name          = "gcaptcha"
  spec.version       = GCaptcha::VERSION
  spec.authors       = ["renyijiu"]
  spec.email         = ["lanyuejin1108@gmail.com"]

  spec.summary       = %q{A gem to generate captcha pictures.}
  spec.description   = %q{A gem to generate captcha pictures.}
  spec.homepage      = "https://github.com/renyijiu/gcaptcha"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = %w(lib)

  spec.license       = "MIT"
  spec.extensions    = %w[ext/gcaptcha/extconf.rb]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency 'rake-compiler', '~> 1'
end
