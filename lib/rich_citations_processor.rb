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

require 'oj'
require 'active_support'
require 'active_support/dependencies'
require 'active_support/core_ext'

ActiveSupport::Dependencies.autoload_paths += [ 'lib' ]

require 'rich_citations_processor/base'
require 'rich_citations_processor/version'
require 'rich_citations_processor/extensions'
require 'rich_citations_processor/config'
require 'rich_citations_processor/initialization'
require 'rich_citations_processor/uri'  # Required because URI is also a root class
require 'rich_citations_processor/base'
require 'rich_citations_processor/version'
require 'rich_citations_processor/extensions'
require 'rich_citations_processor/config'
require 'rich_citations_processor/initialization'
require 'rich_citations_processor/uri'  # Required because URI is also a root class
require "rich_citations_processor/parsers"
require "rich_citations_processor/parsers/base"
require "rich_citations_processor/parsers/registry"
require "rich_citations_processor/parsers/citation_grouper"
require "rich_citations_processor/parsers/jats"
require "rich_citations_processor/parsers/jats/author_parser"
require "rich_citations_processor/parsers/jats/citation_group_parser"
require "rich_citations_processor/parsers/jats/jats_to_html"
require "rich_citations_processor/parsers/jats/reference_parser"

require "rich_citations_processor/models/base"
require "rich_citations_processor/models/paper"
require "rich_citations_processor/models/citing_paper"
require "rich_citations_processor/models/author"
require "rich_citations_processor/models/citation_group"
require "rich_citations_processor/models/cited_paper"
require "rich_citations_processor/models/collection"
require "rich_citations_processor/models/duplicate_error"
require "rich_citations_processor/models/reference.rb"

require "rich_citations_processor/uri"
require "rich_citations_processor/uri/base"
require "rich_citations_processor/uri/registry"
require "rich_citations_processor/uri/doi"
require "rich_citations_processor/uri/isbn"
require "rich_citations_processor/uri/wrapper"

require "rich_citations_processor/xml_utilities"
require "rich_citations_processor/serializers"
require "rich_citations_processor/serializers/base"
require "rich_citations_processor/serializers/registry"
require "rich_citations_processor/serializers/json"
