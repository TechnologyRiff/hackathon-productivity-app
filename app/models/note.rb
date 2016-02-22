class Note < ActiveRecord::Base
  belongs_to :user

  def self.get_todays_note(user)
    Note.where(day: Date.today, user: user).first || Note.create(user: user, day: Date.today)
  end
end
