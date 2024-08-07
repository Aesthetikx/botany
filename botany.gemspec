require_relative 'lib/botany/version'

Gem::Specification.new do |spec|
  spec.name = 'botany'
  spec.version = Botany::VERSION
  spec.authors = ['John DeSilva']
  spec.email = ['john@aesthetikx.info']

  spec.summary = 'A framework for bots and scheduled tasks'
  spec.description = spec.summary
  spec.homepage = 'https://github.com/Aesthetikx/botany'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata['rubygems_mfa_required'] = 'true'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'gli', '~> 2'
  spec.add_dependency 'whenever', '~> 1.0'
  spec.add_dependency 'zeitwerk', '~> 2'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
