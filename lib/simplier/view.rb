require 'erb'

module Simplier
  class View

    VIEW_BASE_PATH = 'app/views'.freeze

    def initialize(env)
      @env = env
    end

    def render(binding)
      template = File.read(template_path)
      ERB.new(template).result(binding)
    end

    private

    def controller
      @env['simpllier.controller']
    end

    def action
      @env['simplier.action']
    end

    def template
      @env['simplier.template']
    end

    def template_path      
      path = template || [controller.name, action].join('/')
      Simplier.root.join(VIEW_BASE_PATH, "#{path}.html.erb")
    end

  end
end