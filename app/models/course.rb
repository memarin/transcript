class Course < ActiveRecord::Base
  validates :course_code,
            :course_name, presence: true

  validates :course_code, uniqueness: true

end
