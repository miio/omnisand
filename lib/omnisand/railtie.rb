require 'rails'
require 'omnisand/engine'

module Omnisand

  class Railtie < ::Rails::Railtie #:nodoc:
    initializer 'omnisand' do |app|
      ActiveSupport.on_load(:after_initialize) do
          Rails.application.routes.append do
            mount Omnisand::Engine, :at => '/'
        end
      end
    end
  end
end
