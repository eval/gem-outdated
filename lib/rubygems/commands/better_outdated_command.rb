require 'rubygems'
require 'rubygems/dependency'

class Gem::Commands::BetterOutdatedCommand < Gem::Command
  def initialize(name = 'outdated',
                 summary = 'Display all gems that need updates - with query')
    super name, summary, :name => //
  end
    
  def arguments # :nodoc:
    "STRING        fragment of gem name to search for"
  end

  def usage # :nodoc:
    "#{program_name} [STRING]"
  end

  def execute
    string = get_one_optional_argument
    name = /#{string}/i

    dep = dependency(name)

    outdated(dep).sort.each do |name|
      local = self.source_index(dep).find_name(name).last

      remote_dep = Gem::Dependency.new local.name, ">= #{local.version}"
      remotes = Gem::SpecFetcher.fetcher.fetch remote_dep
      remote = remotes.last.first

      say "#{local.name} (#{local.version} < #{remote.version})"
    end
  end

  protected
    def dependency(name)
      Gem::Dependency.new name, Gem::Requirement.default
    end

    def specs(dep)
      Gem.source_index.search(dep)
    end

    def source_index(dep)
      name_spec_hash = specs(dep).inject({}){|res,spec| res[spec.name]=spec;res}
      Gem::SourceIndex.new(name_spec_hash)
    end

    def outdated(dep)
      source_index(dep).outdated
    end
end
