class Task < ApplicationRecord
	validates :title, presence: true, uniqueness: {case_sensitive: false}
	validates :detail, presence: true
	scope :title_like, -> {all.where('title like ?', "%#{params[:search]}%")}
end
