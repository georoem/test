require 'rails_helper'

RSpec.describe Genre, type: :model do
   # Association test
  # ensure an album record belongs to a single artist record
  it { should belong_to(:artist) }
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:name) }
end
