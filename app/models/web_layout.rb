class WebLayout < ActiveRecord::Base
  include RankedModel
  belongs_to :bloc
  belongs_to :webpage

  ranks :position,
  	:with_same => :webpage_id

end