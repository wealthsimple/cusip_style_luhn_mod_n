# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cusip_style_luhn_mod_n/version"

Gem::Specification.new do |spec|
  spec.name          = "cusip_style_luhn_mod_n"
  spec.version       = CUSIPStyleLuhnModN::VERSION
  spec.authors       = ["Marc Duez", "Peter Graham"]
  spec.email         = ["marc@wealthsimple.com", "peter@wealthsimple.com"]

  spec.summary       = %q{CUSIP-style luhn mod N}
  spec.description   = %q{CUSIP-style luhn mod N}
  spec.homepage      = "https://github.com/wealthsimple/cusip_style_luhn_mod_n"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "bundler-audit"
  spec.add_development_dependency "ws-style"
end
