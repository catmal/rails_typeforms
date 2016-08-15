require "httparty"
require "rails_typeforms/version"
require "rails_typeforms/config"
# Requires
require "active_support/dependencies"

module RailsTypeforms

	# Our host application root path
  # We set this when the engine is initialized
  mattr_accessor :app_root

	@config = RailsTypeforms::Config.new

	def self.config

		if block_given?
			yield(@config)
		else
			@config
		end

	end

  # def self.embed_typeform(typeform)
  #   #code
  # end
  #
  # def self.view_typeform(typeform)
  #   url = Rails.application.routes.url_helpers.typeform_url(typeform, only_path: true)
  #
  #   redirect_to url
  # end

	def self.setup
	  yield self
	end

end


# Require our engine
require "rails_typeforms/engine"