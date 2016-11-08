require 'spec_helper'

describe Contrast::UserApi::ApplicationSettingsRequest do
  it 'can be instantiated' do
    expect(Contrast::UserApi::ApplicationSettingsRequest.new).to_not be_nil
  end
end
