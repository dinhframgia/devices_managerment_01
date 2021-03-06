class BorrowDevice < ApplicationRecord

  after_initialize :set_defaults, unless: :persisted?

  enum borrow_status: [:reject, :wating, :leader_accept,
    :admin_accept, :borrowed, :return]

  has_many :borrow_items, dependent: :destroy

  belongs_to :user

  validates :borrow_date_from, presence: true
  validates :borrow_date_to, presence: true
  validates :status, presence: true,
    inclusion: {in: BorrowDevice.borrow_statuses.values}

  private
  def set_defaults
    self.borrow_type ||= false
  end

end
