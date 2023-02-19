class Customer < ApplicationRecord
    has_one_attached :profile_image
    has_many :posts, dependent: :destroy
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    has_many :customer_food
    has_many :customer_sport
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def get_profile_image(width, height)
    unless profile_image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  def bmi
    (self.weight.to_f / (self.height.to_f / 100) / (self.height.to_f / 100)).round(1)
  end
  def kcal
    (self.height.to_f / 100) * (self.height.to_f / 100)*22*30.round(1)
  end
end
