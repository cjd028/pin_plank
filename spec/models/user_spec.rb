require 'rails_helper'

RSpec.describe User, type: :model do
  it {  should validate_length_of(:password).is_at_least(3) }
  it { should validate_presence_of(:password) }
  it { should have_many(:pins) }
  it { should have_many(:authentication) }
  it { should validate_uniqueness_of(:email) }

  it "should only accept valid emails" do
    @user = User.new(email: "test@gmail.com", password: "123")
    expect(@user.save).to eq true

  end

  it "should not accept any invalid emails" do
    @user = User.new(email: "test", password: "123")
    expect(@user.save).to eq false
  end
end
