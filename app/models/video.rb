class Video < ApplicationRecord
	has_many: :favorite, dependent: :destroy
end
