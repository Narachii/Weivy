# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  nickname               :string(255)      not null
#  sex                    :integer          default(0), not null
#  last_wei               :datetime
#  is_weiting             :boolean
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string(255)
#  uid                    :string(255)
#  avatar                 :string(255)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauthable, omniauth_providers: [:facebook],
         :authentication_keys => [:nickname]

  has_one :location, class_name: "UserLocation"
  has_many :weis, foreign_key: "sender", class_name: "Wei"

  delegate :latitude, to: :location
  delegate :longitude, to: :location

  enum sex: {
    mendy: 0,
    laidy: 1
  }

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["nickname = :value", { :value => nickname }]).first
      else
        where(conditions).first
      end
  end

  def self.from_omniauth(auth)
    user = User.where(uid: auth.info.uid).first
    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        # userモデルが持っているカラムをそれぞれ定義していく
        user.password = Devise.friendly_token[0,20]
        user.nickname = auth.info.name
        user.icon = auth.info.image
        user.uid = auth.uid
        user.provider = auth.provider
      end
    end
  end

  def email_required?
    false
  end
  def email_changed?
    false
  end

  def get_wei_target(target_dist)
    set_calc_distance
    targets = []
    other_sex_users = User.where.not(sex: sex)
    other_sex_users.each do |user|
      dist = calcer.calc_dist(user.latitude, user.longitude)
      targets << user if dist < target_dist
    end
    targets
  end

  private

  def set_calc_distance
    @calcer ||= Wei::CalcDistance.new(latitude, longitude)
  end
end
