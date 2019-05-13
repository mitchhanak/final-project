# == Schema Information
#
# Table name: placements
#
#  id              :integer          not null, primary key
#  position_x      :integer
#  position_y      :integer
#  ad_id           :integer
#  episode_id      :integer
#  created_by      :integer
#  timestamp_start :integer
#  timestamp_end   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Placement < ApplicationRecord
end
