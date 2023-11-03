module ComponentHelper
  MANGO_HELPERS = {
    frame: 'Mango::FrameComponent'
  }.freeze
  # standard:enable Layout/HashAlignment
  MANGO_HELPERS.each do |name, component|
    define_method "mango_#{name}" do |*args, **kwargs, &block|
      render component.constantize.new(*args, **kwargs), &block
    end
  end
  def prepend_option(options, key, value)
    options[key] = [value, options[key]].compact.join(' ')
  end

  def append_option(options, key, value)
    options[key] = [options[key], value].compact.join(' ')
  end

  def fetch_or_fallback(allowed_values, given_value, fallback = nil, deprecated_values: nil, allow_nil: false)
    return if allow_nil && given_value.nil?

    if allowed_values.include?(given_value)
      given_value
    else
      if fallback_raises && ENV['RAILS_ENV'] != 'production' && ENV['STORYBOOK'] != 'true'
        raise InvalidValueError, <<~MSG
          fetch_or_fallback was called with an invalid value.
          Expected one of: #{allowed_values.inspect}
          Got: #{given_value.inspect}
          This will not raise in production, but will instead fallback to: #{fallback.inspect}
        MSG
      end

      fallback
    end
  end
end
