class Lesson < ActiveRecord::Base
  belongs_to :course
  attr_accessible :name, :course_id, :course_day, :video, :quiz
  validates_presence_of :name, :course_id, :course_day
end
