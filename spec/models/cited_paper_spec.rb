# Copyright (c) 2014 Public Library of Science
#
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

require 'spec_helper'

module RichCitationsProcessor::Models

  RSpec.describe CitedPaper do

    describe "::new" do

      it "should create a Cited paper" do
        expect(described_class.new).not_to be_nil
      end

      it "should accept uri and uri_source parameters" do
        instance = described_class.new(uri: TestURI.new('http://example.com/a').wrap)
        expect(instance).to have_attributes(uri: TestURI.new('http://example.com/a').wrap)
      end

    end

    describe '#inspect' do

      it "should return a valid inspection" do
        instance = described_class.new( uri: TestURI.new('http://example.com/a').wrap)
        expect(instance.inspect).to eq('Paper: [test] http://example.com/a')
        expect(instance.inspect).to eq(instance.indented_inspect)
      end

      it "should accept uri and uri_source parameters" do
        instance = described_class.new
        expect(instance.inspect).to eq('Unresolved Paper')
        expect(instance.inspect).to eq(instance.indented_inspect)
      end

    end

  end

end