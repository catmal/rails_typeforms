# CURRENT FILE :: lib/rails_typeforms/engine.rb
module RailsTypeforms

  class Engine < Rails::Engine

    initializer "rails_typeforms.load_app_instance_data" do |app|
      RailsTypeforms.setup do |config|
        config.app_root = app.root
      end
    end

    initializer "rails_typeforms.load_static_assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

  end

end