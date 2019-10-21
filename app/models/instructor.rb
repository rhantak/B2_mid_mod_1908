class Instructor < ApplicationRecord
  validates_presence_of :name
  has_many :instructor_students
  has_many :students, through: :instructor_students

  def student_age_avg
    students.average(:age).round(1)
  end
end
