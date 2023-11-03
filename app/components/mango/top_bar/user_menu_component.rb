class Mango::TopBar::UserMenuComponent < Mango::Component
  renders_one :avatar, Mango::AvatarComponent

  def initialize(name:, detail:, **system_arguments)
    @name = name
    @detail = detail
    @system_arguments = system_arguments
  end
end
