class Poll < ApplicationRecord
  has_many :poll_options, dependent: :destroy
  belongs_to :user

  validates :title, presence: true

  def start!
    self.started = true
  end
end
