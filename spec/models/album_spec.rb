require 'rails_helper'

RSpec.describe Album, type: :model do
  # Association test
  # ensure Album model has a 1:m relationship with the Song model
  it { should have_many(:songs).dependent(:destroy) }
  it { should have_many(:images).dependent(:destroy) }
  # ensure an album record belongs to a single artist record
  it { should belong_to(:artist) }
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:spotify_url) }
  it { should validate_presence_of(:spotify_id) }
  it { should validate_presence_of(:total_tracks) }

end
