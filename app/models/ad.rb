# == Schema Information
#
# Table name: ads
#
#  id         :integer          not null, primary key
#  created_by :integer
#  name       :string
#  width      :integer
#  height     :integer
#  image      :string
#  target_url :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ad < ApplicationRecord
    has_many :ad_permissions, :dependent => :destroy
    has_many :placements, :dependent => :destroy
    has_many :podcasts, :through => :ad_permissions, :source => :podcast
    has_many :episodes, :through => :placements, :source => :episode
    has_many :users, :through => :podcasts, :source => :user
    belongs_to :user
end
