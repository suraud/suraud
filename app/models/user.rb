class User < ActiveRecord::Base
  # :omniauthable, :registerable, :rememberable, :timeoutable
  devise :database_authenticatable,
         :confirmable,
         :recoverable,
         :validatable,
         :trackable,
         :confirmable,
         :lockable
  include DeviseTokenAuth::Concerns::User
end
