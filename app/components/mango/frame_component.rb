# frozen_string_literal: true

module Mango
  class FrameComponent < Mango::Component
    renders_one :top_bar, lambda { |**system_arguments|
      Mango::Frame::TopBarComponent.new(logo: @logo, **system_arguments)
    }
    # renders_one :navigation, lambda { |**system_arguments|
    #   Mango::NavigationComponent.new(logo: @logo, **system_arguments)
    # }

    def initialize(logo: nil, **system_arguments)
      @logo = logo && Mango::Logo.new(**logo)
      @system_arguments = system_arguments
    end

    def system_arguments
      @system_arguments.tap do |opts|
        opts[:tag] = 'div'
        opts[:data] ||= {}
        prepend_option(@system_arguments[:data], :controller, 'mango-frame')
        opts[:classes] = class_names(
          opts[:classes],
          'antialiased',
          'bg-white',
          'dark:bg-gray-800'
        )
      end
    end
  end
end
