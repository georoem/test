require 'rails_helper'

RSpec.describe Song, type: :model do
  # Association test
  # ensure an album record belongs to a single album record
  it { should belong_to(:album) }
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:spotify_url) }
  it { should validate_presence_of(:spotify_id) }
  it { should validate_presence_of(:preview_url) }
  it { should validate_presence_of(:duration_ms) }
  it { should validate_presence_of(:explicit) }
end
