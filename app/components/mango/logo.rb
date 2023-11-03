# frozen_string_literal: true

class Mango::Logo
  attr_reader :src, :url, :alt, :width, :text

  def initialize(src:, url: nil, alt: nil, width: '', text: '')
    @url = url
    @src = src
    @alt = alt
    @width = width
    @text = text
  end
end
