module Sprockets
  module Translate

    class Parser

      attr_accessor :data

      def initialize(data, keys)
        @data = data
        @keys = keys
        interpolation
        i18n_replace
      end

      def interpolation
        @keys.each do |key|
          @data.gsub!(key, I18n.t(key))
        end
      end

      def i18n_replace
        @data.gsub!('I18n.t', 'NB.interpolation')
      end

    end

  end
end
