require_relative '../rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryBot.build(:user) }

  subject { @user }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of (:password) }
  it { should validate_confirmation_of(:password) }
  it { should validate_uniqueness_of (:password_confirmation) }

  it { should allow_value('example@domain.com').for(:email) }
end
