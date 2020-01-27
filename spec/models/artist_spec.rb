require 'rails_helper'

RSpec.describe Artist, type: :model do
  # Association test
  # ensure Artist model has a 1:m relationship with the Album model
  it { should have_many(:albums).dependent(:destroy) }
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:spotify_url) }
  it { should validate_presence_of(:spotify_id) }
  it { should validate_presence_of(:popularity) }

end
