class Profile < ActiveRecord::Base
  belongs_to :user
  
  validate :one_or_other, :not_sue, :gender_check
  
  def one_or_other
    if first_name.nil? && last_name.nil? 
      errors.add(:first_name, "first and last name both cannot be null")
    end
  end
  
  def gender_check
    if gender != "male" && gender != "female"
      errors.add(:gender, "must be male or female")
    end
  end
  
  def not_sue
    if first_name == "Sue" && gender == "male"
      errors.add(:gender, "can't be a boy named Sue")
    end
  end
  
  def self.get_all_profiles(min, max)
    Profile.where("birth_year BETWEEN ? AND ?", min, max).order(birth_year: :asc)
  end
  
end
