class BucketBloc < ActiveRecord::Base
  belongs_to :user
  belongs_to :bloc
end
