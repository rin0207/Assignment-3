class Book < ApplicationRecord
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, length: { in: 1..200}
	belongs_to :user
	attachment :profile_image
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end

