require "aspecta/version"
require "fastimage"

class DimensionsValidator < ActiveModel::EachValidator
  DIMENSIONS = [:width, :height]
  ATTRIBUTES = { :minimum => :>=, :maximum => :<= }
  MESSAGES = {
    :width => {
      :minimum => :image_is_too_narrow,
      :maximum => :image_is_too_wide
    },
    :height => {
      :minimum => :image_is_too_short,
      :maximum => :image_is_too_tall
    }
  }

  def validate_each(record, attribute, value)
    return if value.file.nil?

    if options.empty?
      raise ArgumentError, "Specify the :width and / or :height option"
    end

    DIMENSIONS.each do |dimension|
      unless options[dimension].nil?
        if (ATTRIBUTES.keys & options[dimension].keys).empty?
          raise ArgumentError,
            "Specify the :minimum and / or :maximum option for :#{dimension}"
        end
      end
    end

    dimensions = FastImage.size value.path

    if dimensions.nil?
      record.errors.add(attribute, :invalid)
    else
      DIMENSIONS.each_with_index do |dimension, index|
        next if options[dimension].nil?

        options[dimension].each do |measure, size|
          unless dimensions[index].send(ATTRIBUTES[measure], size)
            record.errors.add(attribute,
              MESSAGES[dimension][measure],
              :size => size
            )
          end
        end
      end
    end
  end
end