class Subject < ActiveRecord::Base
  validates :subject_code,
            :subject_name,
            :units, presence: true

  validates :subject_code, uniqueness: true
end
