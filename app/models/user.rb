class User < ApplicationRecord

  # Relationships
  after_create :set_default_role
  belongs_to :role, optional: true
  has_many :wikis, class_name: 'Wiki'
  acts_as_commontator 
  acts_as_voter
  
  enum role: [:member, :author, :moderator, :admin]
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


  def author?
    (role == :author || role == 'author')?
    true:false
  end

  def change_role
    self.update(role_id: Role.find_by(code: 'author').id)
    self.save!
  end

  private 

  def set_default_role
    self.update(role_id: Role.find_by(code: 'member').id)
  end

end
