class Mango::Frame::TopBarComponent < Mango::Component
  renders_one :user_menu, Mango::TopBar::UserMenuComponent
  renders_one :notification, Mango::TopBar::NotificationComponent
  # renders_one :search_field

  def initialize(logo:, **system_arguments)
    @logo = logo.is_a?(Hash) ? Mango::Logo.new(**logo) : logo
    @system_arguments = system_arguments
  end

  def system_arguments
    @system_arguments.tap do |opts|
      opts[:tag] = 'nav'
      # bg-white.border-gray-200.px-4.py-3.dark:bg-gray-800
      opts[:classes] = class_names(
        @system_arguments[:classes],
        'bg-white',
        'border-b',
        'border-gray-200',
        'px-4',
        'py-3',
        'dark:bg-gray-800'
      )
    end
  end
end
