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
  has_one :managed_department, class_name: 'Department', foreign_key: 'manager_id'
  belongs_to :region
  has_many :handovers
  has_many :user_sites
  has_many :sites, through: :user_sites 
  has_many :work_sessions
  # has_many :active_tasks, through: :work_sessions, source: :task, -> { where(completable: :can_complete) }

  has_many :active_tasks, -> { where(tasks: { completable: Task.completable[:can_complete] }) },
           through: :work_sessions, source: :task
 
 # cattr_accessor :form_steps do
  #   %w(sign_up set_department set_manager)
  # end 
  # attr_accessor :form_step
  
end
