# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
has_many :episodes, :foreign_key => "created_by", :dependent => :destroy
has_many :placements, :foreign_key => "created_by", :dependent => :destroy
has_many :podcasts, :foreign_key => "created_by", :dependent => :destroy
has_many :ad_permissions, :through => :podcasts, :source => :ad_permissions
has_many :ads, :through => :podcasts, :source => :ads

end
