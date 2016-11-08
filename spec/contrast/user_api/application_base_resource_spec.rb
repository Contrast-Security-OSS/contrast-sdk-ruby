require 'spec_helper'

describe Contrast::UserApi::ApplicationBaseResource do
  it 'can be instantiated' do
    expect(Contrast::UserApi::ApplicationBaseResource.new).to_not be_nil
  end
end
