module Abizvn
  module Cms
    class Category < ApplicationRecord
      include Commonbase::RansackSearchable
    
      self.table_name = 'cms_categories'

      belongs_to :status, class_name: 'Abizvn::General::GeneralSetting'
      
      has_many :articles, foreign_key: :category_id

      validates :status, :code, :name, presence: true
    end
  end
end
