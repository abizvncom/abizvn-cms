module Abizvn
  module Cms
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
