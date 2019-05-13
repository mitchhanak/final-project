# == Schema Information
#
# Table name: ad_permissions
#
#  id         :integer          not null, primary key
#  ad_id      :integer
#  podcast_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AdPermission < ApplicationRecord
    belongs_to :podcast
    belongs_to :ad
    has_one :user, :through => :podcast, :source => :user
end
