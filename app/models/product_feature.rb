class ProductFeature < ApplicationRecord
  belongs_to :feature
  belongs_to :product
end
