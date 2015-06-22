class Student < ActiveRecord::Base
  validates :student_number,
            :first_name,
            :middle_name,
            :last_name,
            :address,
            :birthday,
            :birthplace, presence: true

  validates :student_number, uniqueness: true

end
