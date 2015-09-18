class Abstractifier
  DEFAULT_MINIMUM_LENGTH = 80
  DEFAULT_MAXIMUM_LENGTH = 250

  attr_accessor :max_length, :min_length, :elider

  def initialize(options = {})
    @min_length = options.fetch(:min, DEFAULT_MINIMUM_LENGTH)
    @max_length = options.fetch(:max, DEFAULT_MAXIMUM_LENGTH)
    @elider = options.fetch(:elider, '…')
  end

  def abstractify(string)
    output = ''

    extract_sentences(string).each do |sentence|
      output << "#{sentence}. "
      break if output.length >= min_length
    end

    output = forcibly_truncate(output) if output.length > max_length
    output = tidy(output)

    output
  end

  private

  def forcibly_truncate(string)
    truncated = string[0, max_length + 1].strip.split(/\s\b\w+$/).first

    strip_trailing_punctuation(truncated)
  end

  def extract_sentences(string)
    string
      .gsub(/[[:space:]]+/, ' ')
      .split(/\.(?:\s|$)/)
  end

  def strip_trailing_punctuation(string)
    if string[-1] =~ /[\.\?\!]/
      string
    elsif string[-1] =~ /[[:punct:]]/
      string[0..-2] + elider
    else
      string + elider
    end
  end

  def tidy(str)
    str
      .gsub(/[[:space:]]+/, ' ')
      .gsub(/[[:space:]](,|\.)/, '\1')
      .strip
  end
end
