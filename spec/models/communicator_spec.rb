require 'rails_helper'

RSpec.describe Communicator, type: :model do
  let(:valid_data) {
    { handle: ' foo-oo.ahh_yeah ', full_name: ' Foo Bar ' }
  }

  it "strips surrounding whitespace from handle" do
    actual = Communicator.create( valid_data )
    expect( actual.handle ).to eq('foo-oo.ahh_yeah')
  end

  it "strips surrounding whitespace from full name" do
    actual = Communicator.create( valid_data )
    expect( actual.full_name ).to eq('Foo Bar')
  end

  it "is valid with valid data" do
    actual = Communicator.create( valid_data )
    expect( actual ).to be_valid
  end

  it "requires handle to be present" do
    actual = Communicator.create(
      valid_data.merge( :handle => ' ' )
    )
    actual.valid?
    expect( actual.errors.added?(:handle, :blank) ).to eq( true )
  end

  it "requires full_name to be present" do
    actual = Communicator.create(
      valid_data.merge( :full_name => ' ' )
    )
    actual.valid?
    expect( actual.errors.added?(:full_name, :blank) ).to eq( true )
  end

  it "rejects a handle containing characters other than word-chars, dashes, and periods" do
    actual = Communicator.create(
      valid_data.merge( :handle => 'bad handle' )
    )
    actual.valid?
    expect( actual.errors.added?(:handle, :has_invalid_char) ).to eq( true )
  end

end
