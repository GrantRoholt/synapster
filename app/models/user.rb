# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  first_name         :string(255)
#  last_name          :string(255)
#  ssn                :text
#  national_id_number :text
#  birth_date         :text
#  facebook_id        :string(255)
#  twitter_id         :string(255)
#  linkedin_id        :string(255)
#  credit_score       :integer
#  blood_pressure     :integer
#  heart_rate         :integer
#  mph                :integer
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible(:birth_date, :blood_pressure, :credit_score, :email, :facebook_id, :first_name, :heart_rate, :last_name, :linkedin_id, :mph, :name, :national_id_number, :ssn, :twitter_id, :password, :password_confirmation)
  has_secure_password
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower  

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates(:name, presence: true, length: { maximum: 50 })   # "validates" is just a method, as is "attr_accessible" above
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false })   # "validates" is just a method, as is "attr_accessible" above
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def feed
    Micropost.from_users_followed_by(self)
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end
  
  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
