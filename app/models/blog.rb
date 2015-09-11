class Blog < ActiveRecord::Base
  has_many :entries, ->  {order(created_at: :DESC, id: :DESC)}, dependent: :destroy

  validates :title, presence: true
end
