class BucketBloc < ActiveRecord::Base
  belongs_to :user
  belongs_to :bloc

  validates :user, presence: true
  validates :bloc, presence: true
end
