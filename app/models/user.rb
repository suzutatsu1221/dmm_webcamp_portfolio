class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    enum sex: { male: 0, female: 1, others: 2 }
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :email, presence: true
    validates :sex, presence: true
    validates :password, presence: true
end
