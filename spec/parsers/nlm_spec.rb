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
require 'support/builders/nlm'

describe RichCitationsProcessor::Parsers::NLM do
  include Spec::Builders::NLM

  let (:parser) { RichCitationsProcessor::Parsers::NLM.new(xml) }
  let (:paper)  { parser.parse! }

  describe "Parsing" do

    it "should parse from a Nokogiri document" do
      expect(xml).to be_a_kind_of(Nokogiri::XML::Document)
      parser = RichCitationsProcessor::Parsers::NLM.new(xml)
      parser.parse!
    end

    it "should parse from a String document" do
      xmls = xml.to_s
      parser = RichCitationsProcessor::Parsers::NLM.new(xmls)
      parser.parse!
    end

  end

  describe "Identifier parsing" do

    it "Should parse out the identifier" do
      article_id '10.12345/1234.12345', :doi
      expect(paper.uri).to eq(RichCitationsProcessor::URI::DOI.new('10.12345/1234.12345', source:'document') )
    end

    it "Should do nothing if there is no valid identifier" do
      article_id '10.12345/1234.12345', :unknown
      expect(paper.uri).to be_nil
    end

    it "Should do nothing if there is no identifier to parse" do
      expect(paper.uri).to be_nil
    end

  end

  describe "Parsing of metadata (excluding authors, references and ccitation groups)" do

    it "should include the word count" do
      body 'here is <b>some</b> text'
      expect(paper.word_count).to eq(4)
    end

  end

end
