require 'rails_helper'

RSpec.describe Image, type: :model do
  # Association test
  # ensure an album record belongs to a single artist and album record
  it { should belong_to(:artist) }
  it { should belong_to(:album) }
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:height) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:width) }
end
