require 'tilt'

module Sprockets
  module Translate

    class Processor < Tilt::Template

      def keys
        data.scan(/t\(\W([\w\S]+)["|\']/).flatten
      end

      def prepare; end

      def evaluate(context, locals, &block)
        if Rails.env == 'development'
          @parser = Parser.new(data, keys) if keys.any?
        end

        @parser.try(:data) ? @parser.data : data
      end

    end

  end
end
