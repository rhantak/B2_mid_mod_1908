require 'rails_helper'

describe Student, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :cohort}
    it { should validate_presence_of :age}
  end

  describe 'relationships' do
    it { should have_many :instructors }
    it { should have_many :instructor_students}
  end
end
