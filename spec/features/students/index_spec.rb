require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the students index page' do
    before(:each) do
      @student_1 = Student.create(name: "Bob G", age: 25, cohort: "1908")
      @student_2 = Student.create(name: "Neil Armstrong", age: 34, cohort: "1908")
      @instructor_1 = Instructor.create(name: "Mike")
      @instructor_2 = Instructor.create(name: "Meg")
      @inst_student_1 = InstructorStudent.create(student_id: @student_1.id, instructor_id: @instructor_1.id)
      @inst_student_2 = InstructorStudent.create(student_id: @student_2.id, instructor_id: @instructor_1.id)
      @inst_student_3 = InstructorStudent.create(student_id: @student_1.id, instructor_id: @instructor_2.id)
      @inst_student_4 = InstructorStudent.create(student_id: @student_2.id, instructor_id: @instructor_2.id)
    end

    it "I see each student's information, including a link to each of their instructors" do
      visit '/students'

      within("#student-#{@student_1.id}") do
        expect(page).to have_content(@student_1.name)
        expect(page).to have_content(@student_1.age)
        expect(page).to have_content(@student_1.cohort)
        expect(page).to have_link(@instructor_1.name)
        expect(page).to have_link(@instructor_2.name)
      end

      within("#student-#{@student_2.id}") do
        expect(page).to have_content(@student_2.name)
        expect(page).to have_content(@student_2.age)
        expect(page).to have_content(@student_2.cohort)
        expect(page).to have_link(@instructor_1.name)
        expect(page).to have_link(@instructor_2.name)
      end

    end
  end
end
