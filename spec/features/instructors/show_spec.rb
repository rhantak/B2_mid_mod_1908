require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit an instructor show page' do
    before(:each) do
      @student_1 = Student.create(name: "Bob G", age: 25, cohort: "1908")
      @student_2 = Student.create(name: "Neil Armstrong", age: 34, cohort: "1908")
      @student_3 = Student.create(name: "Ryan", age: 26, cohort: "1909")
      @instructor_1 = Instructor.create(name: "Mike")
      @instructor_2 = Instructor.create(name: "Meg")
      @instructor_3 = Instructor.create(name: "Joe")
      @inst_student_1 = InstructorStudent.create(student_id: @student_1.id, instructor_id: @instructor_1.id)
      @inst_student_2 = InstructorStudent.create(student_id: @student_2.id, instructor_id: @instructor_1.id)
      @inst_student_3 = InstructorStudent.create(student_id: @student_1.id, instructor_id: @instructor_2.id)
      @inst_student_4 = InstructorStudent.create(student_id: @student_2.id, instructor_id: @instructor_2.id)
      @inst_student_5 = InstructorStudent.create(student_id: @student_3.id, instructor_id: @instructor_3.id)
    end

    it "I see a list of all their students and the average age of all students" do
      visit '/students'

      within("#student-#{@student_1.id}") do
        click_link "#{@instructor_1.name}"
      end
      
      expect(current_path).to eq("/instructors/#{@instructor_1.id}")

      expect(page).to have_content(@instructor_1.name)
      expect(page).to have_content(@student_1.name)
      expect(page).to have_content(@student_2.name)
      expect(page).to have_content("Average Student Age: 29.5")

      visit "/instructors/#{@instructor_2.id}"

      expect(page).to have_content(@instructor_2.name)
      expect(page).to have_content(@student_1.name)
      expect(page).to have_content(@student_2.name)
      expect(page).to have_content("Average Student Age: 29.5")

      visit "/instructors/#{@instructor_3.id}"

      expect(page).to have_content(@instructor_3.name)
      expect(page).to have_content(@student_3.name)
      expect(page).to have_content("Average Student Age: 26")
    end
  end
end
