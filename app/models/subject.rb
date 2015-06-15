class Subject < ActiveRecord::Base
  validates :subject_code,
            :subject_name,
            :units, presence: true
end
