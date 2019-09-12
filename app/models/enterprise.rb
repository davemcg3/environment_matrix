class Enterprise < ApplicationRecord
  belongs_to :environments
  belongs_to :services
end
