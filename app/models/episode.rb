# == Schema Information
#
# Table name: episodes
#
#  id          :integer          not null, primary key
#  created_by  :integer
#  title       :string
#  podcast_id  :integer
#  audio       :string
#  xml         :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Episode < ApplicationRecord
    belongs_to :user, :foreign_key => "created_by"
    has_many :placements, :dependent => :destroy
    belongs_to :podcast
    has_many :ads, :through => :placements, :source => :ad
    
    mount_uploader :audio, AudioUploader
end