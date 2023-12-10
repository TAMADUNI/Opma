class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/
  validates :email, presence: true, length: { in: 8..20 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: true }, on: :create
  validates :password, presence: true, length: { in: 3..20 }, on: :create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  belongs_to :department
  belongs_to :manager, class_name: 'User', optional: true

  validates_associated :department, presence: true, if: :set_department
  # cattr_accessor :form_steps do
  #   %w(sign_up set_department set_manager)
  # end 

  # attr_accessor :form_step

  def set_department
    # Assuming you have a virtual attribute like current_step
    current_step == :set_department
  end
end
