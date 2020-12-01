class User < ApplicationRecord

  # Relationships
 
  has_many :wikis, class_name: 'Wiki'
  acts_as_commontator 
  acts_as_voter
  
  # Roles
  enum role: [:member, :author, :moderator, :admin]

  # After initialize set default role
  after_initialize :set_default_role, :if => :new_record?

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
  
  # returns true if user is an author
  def author?
    role == 'author' ? true : false
  end

  # set user role to author
  def author
    self.role = :author
    save
  end

  # returns true if user is a member
  def member?
    role == 'member' ? true : false
  end

  # set user role to member
  def member
    self.role = :member
    save
  end

  # returns true if user is a moderator
  def moderator?
    role == 'moderator' ? true : false
  end

  # set user role to moderator
  def moderator
    self.role = :moderator
    save
  end

  # returns true if user is an admin
  def admin?
    role == 'admin' ? true : false
  end

  # set user role to admin
  def admin
    self.role = :admin
    save
  end

  private 
    def set_default_role
      self.role ||= :member
    end
end
