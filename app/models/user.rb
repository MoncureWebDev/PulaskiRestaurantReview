class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  
  has_many :reviews, dependent: :destroy

  #If a user is deleted, ALL reviews written by that user should be destroyed as well








  #  THE MODEL'S JOB IS TO HANDLE ANY DATA-RELATED TASKS
  # This is why validation code belongs here.  We'll get active record validation code from RailsGuides:


  validates :first_name, :last_name, presence: true

end
