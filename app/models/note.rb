class Note < ActiveRecord::Base
  belongs_to :user

  def self.get_todays_note(user)
    find_by(day: Date.today) || create(user: user, day: Date.today)
  end
end
