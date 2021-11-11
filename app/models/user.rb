class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :user_profile
  has_one :codewars_info

  after_create :create_profile 

  def create_profile
    build_user_profile(
      first_name: 'JP',
      last_name: 'JOJO',
      codewars_nickname: 'Felipé',
      city: 'Ville',
      country: 'France',
      date_of_birth: Date.today  
    ).save
  end
end
