class BaseModel < ApplicationRecord
  belongs_to :user
  DATA_KEYS = ['']
end
