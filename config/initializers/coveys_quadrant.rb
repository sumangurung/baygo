require 'coveys_quadrant'
ActiveRecord::Base.class_eval do
  include SumanGurung::CoveysQuadrant
end
