require "abizvn/cms/version"
require "abizvn/cms/engine"

module Abizvn
  module Cms
    mattr_accessor :category_class

    def self.category_class
      @@category_class ||= "Category"
    end
  end
end
