module Abizvn
  module Cms
    class Article < ApplicationRecord
      extend FriendlyId
      include Commonbase::RansackSearchable

      self.table_name = 'cms_articles'

      scope :ordered, -> { order(updated_at: :desc) }

      belongs_to :status, class_name: 'Abizvn::General::GeneralSetting'
      belongs_to :category, class_name: 'Category', counter_cache: true

      has_many :comments, as: :commentable, dependent: :destroy

      friendly_id :slug_candidates

      validates :status, :category, :title, presence: true

      private

      def slug_candidates
        [
          [:title_ascii],
          [:title_ascii, :now_yyyymmdd],
          [:title_ascii, :now_yyyymmdd, :id]
        ]
      end

      def title_ascii
        title.to_ascii
      end

      def now_yyyymmdd
        Time.current.strftime('%y%m%d')
      end
    end
  end
end
