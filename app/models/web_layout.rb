class WebLayout < ActiveRecord::Base
  belongs_to :bloc
  belongs_to :webpage

  include RankedModel
  ranks :position
end