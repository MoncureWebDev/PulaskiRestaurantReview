class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  
  has_many :reviews, dependent: :destroy

  #If a user is deleted, ALL reviews written by that user should be destroyed as well


end
