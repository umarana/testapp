# frozen_string_literal: true

module Mango
  class AvatarComponent < Mango::Component
    SIZE_DEFAULT = :medium
    SIZE_MAPPINGS = {
      extra_small: 'w-6 h-6',
      small: 'w-8 h-8',
      medium: 'w-10 h-10',
      large: 'w-20 h-20',
      extra_large: 'w-36 h-36'

    }
    SIZE_OPTIONS = SIZE_MAPPINGS.keys

    SHAPE_DEFAULT = :round
    SHAPE_MAPPINGS = {
      square: 'rounded',
      round: 'rounded-full'
    }
    SHAPE_OPTIONS = SHAPE_MAPPINGS.keys
    # Bordered
    BORDERED_DEFAULT = false
    BORDERED_MAPPINGS = {
      true: 'p-1 ring-2 ring-primary-300 dark:ring-primary-500',
      false: ''
    }
    BORDERED_OPTIONS = BORDERED_MAPPINGS.keys

    def initialize(
      initials: nil,
      placeholder: nil,
      size: SIZE_DEFAULT,
      shape: SHAPE_DEFAULT,
      bordered: BORDERED_DEFAULT,
      source: nil,
      **system_arguments
    )
      @initials = initials
      @placeholder = placeholder
      @size = size
      @shape = shape
      @source = source
      @system_arguments = system_arguments
    end
  end
end
