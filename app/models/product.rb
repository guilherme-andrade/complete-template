class Product < ApplicationRecord
  belongs_to :user
  has_many :product_features
  has_many :features, through: :product_features
  has_attachment :photo


  serialize :tags


  # Algolia Search code
  include AlgoliaSearch

  algoliasearch do
    attribute :features do

      # build an array of features (include only `title` and `category`)
      features.map do |s|
        { name: s.name, category: s.category }
      end
    end
  end


end
