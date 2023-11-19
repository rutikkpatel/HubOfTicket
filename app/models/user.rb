class User < ApplicationRecord
  resourcify
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :birth_date, presence: true
  validate :date_of_birth,

  def date_of_birth
    if birth_date.present? && birth_date > Date.today
      errors.add(:birth_date, "can't be in future")
    end
  end

  validates :first_name, :last_name, :gender, presence: true
  validates :contact_number, presence: true, uniqueness: true, numericality: {only_integer: true}

  has_many :bookings, dependent: :destroy

  def to_s
    email
  end

  after_create do
    customer = Stripe::Customer.create(email: email)
    update(stripe_customer_id: customer.id)
  end

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end
end