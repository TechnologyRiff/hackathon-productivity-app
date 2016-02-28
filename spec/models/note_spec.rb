require 'rails_helper'

RSpec.describe Note, type: :model do
  it { should belong_to :user }
  it { should have_db_column :summary }
  it { should have_db_column :user_id }

  describe "#get_todays_note(user)" do
    it "returns a new note that belongs to the user" do
      user = User.create(email: "test2@google.com", password: "12345678")
      expect(Note.get_todays_note(user).user).to eq user
    end

    it "returns a new note for that day if one does not exist" do
      user = User.create(email: "test@test.com", password: "12345678")
      expect(Note.get_todays_note(user).day).to eq Date.today
    end

    it "returns a note for that day if it already exists" do
      user = User.create(email: "test@test.com", password: "12345678")
      note = Note.create(user: user, day: Date.today)
      expect(Note.get_todays_note(user)).to eq note
    end

    it "returns a note for that day and that user if one exists" do
      user = User.create(email: "test@test.com", password: "12345678")
      note = Note.create(user: user, day: Date.today)
      expect(Note.get_todays_note(user).user).to eq user
    end

    it "doesn't return other user's note" do
      other_user = User.create(email: "othertest@test.com", password: "12345678")
      note       = Note.create(user: other_user, day: Date.today)
      user       = User.create(email: "test@test.com", password: "12345678")
      expect(Note.get_todays_note(user).user).to eq user
    end
  end
end
