class WebLayout < ActiveRecord::Base
  belongs_to :bloc
  belongs_to :webpage

  acts_as_list scope: :webpage
end

# webpage.last.move_to_bottom
# webpage.first.move_higher