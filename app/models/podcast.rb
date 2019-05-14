# == Schema Information
#
# Table name: podcasts
#
#  id         :integer          not null, primary key
#  created_by :integer
#  logo       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Podcast < ApplicationRecord
    belongs_to :user, :foreign_key => "created_by"
    has_many :episodes, :dependent => :destroy
    has_many :ad_permissions, :dependent => :destroy
    has_many :ads, :through => :ad_permissions, :source => :ad

    mount_uploader :logo, LogoUploader
end