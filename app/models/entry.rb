class Entry < ActiveRecord::Base
  has_many :comments, -> {order(created_at: :DESC, id: :DESC)}, dependent: :destroy
  belongs_to :blog

  validates :title, presence: true
end
