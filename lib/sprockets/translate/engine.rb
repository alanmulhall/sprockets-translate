module Sprockets
  module Translate
    class Engine < ::Rails::Engine

      initializer :setup_translate,
                  after: 'sprockets.environment',
                  before: "i18n-js.asset_dependencies",
                  group: :all do |app|

        app.assets.register_preprocessor 'application/javascript', Sprockets::Translate::Processor

      end

    end
  end
end
