class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  def permitted_attributes
    attributes = []
    self.class.column_names.each do |attribute|
      attributes << attribute unless unpermitted_attributes.include? attribute
    end
    attributes
  end

  private

  def unpermitted_attributes
    ["id", "created_at", "updated_at"]
  end

  def order_attributes

  end
end
