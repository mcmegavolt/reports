class User < ActiveRecord::Base
  
  before_create :set_default_role
  
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
  
  belongs_to :role
  has_many :reports, :dependent => :destroy
  
  def admin?
  	self.role.name == 'admin'
  end 

  def set_default_role
  	self.role = Role.find_by_name('user') if self.role_id.nil?
  end

end
