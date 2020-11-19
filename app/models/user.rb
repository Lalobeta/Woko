class User < ApplicationRecord
  # Relationships
  after_create :set_default_role
  belongs_to :role, optional: true
  has_many :wikis, class_name: 'Wiki'
  
  
  # Devise
  # Include default devise modules. Others available are:
  # :confirmable :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one_attached :profile_picture, dependent: :destroy
  validates :profile_picture, content_type: [:png, :jpg, :jpeg]
  validates :first_name, :last_name, :email, presence: true
  

  def full_name
    "#{first_name} #{last_name}"
  end

  def change_role
    update(role_id: Role.find_by(code: 'author').id)
  end

  private 

  def set_default_role
    self.update(role_id: Role.find_by(code: 'member').id)
  end

end
