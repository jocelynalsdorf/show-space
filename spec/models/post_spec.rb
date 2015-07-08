require 'rails_helper'

describe Post do
  it { should validate_presence_of :title }
  it { should validate_presence_of :link }
  it { should validate_presence_of :description }

  # it { should have_many :questions }
  # it { should have_many :answers }
end