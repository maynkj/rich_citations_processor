# Copyright (c) 2014 Public Library of Science

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

module RichCitationsProcessor
  module URI

    class Base
      attr_reader :source

      def self.matches?(identifier, type:)
        method_not_implemented_error
      end

      def initialize(identifier, source:)
        @identifier = identifier
        @source     = source
      end

      def full_uri
        method_not_implemented_error
      end

      def ==(other)
        case other
          when Base
            self.class == other.class && self.source == other.source && self.full_uri == other.full_uri

          when String
            full_uri == other

          else
            raise "Unable to compare URI with #{other.class}"

        end
      end

      def as_json(options=nil)
        full_uri
      end

      def inspect
        "[#{source}] #{full_uri}"
      end

      protected

      attr_reader :identifier

      private

      def self.inherited(subclass)
        Registry.add(subclass)
      end

    end
  end
end