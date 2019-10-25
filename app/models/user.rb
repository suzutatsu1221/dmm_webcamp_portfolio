class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :favorite, dependent: :destroy
    has_many :video, dependent: :destroy
    enum sex: { male: 0, female: 1, others: 2 }

    def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

end
