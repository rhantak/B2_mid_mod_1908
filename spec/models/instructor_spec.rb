require 'rails_helper'

require 'rails_helper'

describe Instructor, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'relationships' do
    it { should have_many :students }
    it { should have_many :instructor_students}
  end

  describe 'instance methods' do
    it "can calculate the average age of all its students" do

      student_1 = Student.create(name: "Bob G", age: 25, cohort: "1908")
      student_2 = Student.create(name: "Neil Armstrong", age: 34, cohort: "1908")
      instructor_1 = Instructor.create(name: "Mike")
      inst_student_1 = InstructorStudent.create(student_id: student_1.id, instructor_id: instructor_1.id)
      inst_student_2 = InstructorStudent.create(student_id: student_2.id, instructor_id: instructor_1.id)

      expect(instructor_1.student_age_avg).to eq(29.5)
    end
  end
end
