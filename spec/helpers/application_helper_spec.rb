require 'rails_helper'

module ApplicationHelperSpec
  class Model < Struct.new(:foo)
    include ActiveModel::Model
  end
end

RSpec.describe ApplicationHelper, type: :helper do
  describe '#render_errors' do
    let(:errors) { ActiveModel::Errors.new(model) }
    let(:model)  { ApplicationHelperSpec::Model.new }

    it "includes the error count" do
      errors.add :foo, :a
      expect( helper.render_errors(errors) ).to match(/\b1\b/)
      errors.add :foo, :b
      expect( helper.render_errors(errors) ).to match(/\b2\b/)
    end

    it "includes each error message" do 
      errors.add :foo, "must be sane"
      errors.add :foo, "must be encouraging"
      actual = helper.render_errors(errors)
      expect( helper.render_errors(errors) ).to match("Foo must be sane")
      expect( helper.render_errors(errors) ).to match("Foo must be encouraging")
    end
  end
end
