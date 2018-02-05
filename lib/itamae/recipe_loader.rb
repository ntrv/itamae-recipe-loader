require 'itamae'
require 'itamae/recipe_loader/version'

module Itamae
  class RecipeLoader
    attr_reader :backend
    attr_reader :runner

    def initialize(recipe_files, backend_type, options)
      self.class.logger_init(options)
      @targets = []
      backend = Itamae::Backend.create(backend_type, options)
      @runner = Itamae::Runner.new(backend, options)
      @runner.load_recipes(recipe_files)
    end

    def self.logger_init(options)
      Itamae.logger.level = ::Logger.const_get(options[:log_level].upcase) if options[:log_level]
      Itamae.logger.formatter.colored = options[:color] if options[:color]
    end

    def all_recipe_names(reject_recipes = ['recipes'])
      recipe_names(@runner.children) - reject_recipes
    end

    private

    def recipe_names(children)
      children.each do |child|
        next unless child.is_a?(Itamae::Recipe)
        @targets.push(File.basename(child.dir))
        recipe_names(child.children) if child.children.count.positive?
      end
      @targets.uniq
    end
  end
end
