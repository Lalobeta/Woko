class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_create :set_default_role
  belongs_to :role, optional: true
  def full_name
    "#{first_name} #{last_name}"

  end

  private

  def set_default_role
    self.update(role_id: Role.find_by(code: 'default').id)
  end
end
