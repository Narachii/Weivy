class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :authentication_keys[],
         :recoverable, :rememberable, :trackable, :validatable
end
