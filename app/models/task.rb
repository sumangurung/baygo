class Task < ActiveRecord::Base
  acts_as_coveys_quadrant
  acts_as_nested_set
  validates_presence_of :title
end
