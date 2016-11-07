require "spec_helper"

describe Contrast::UserApi do
  it "has a version number" do
    expect(Contrast::UserApi::VERSION).not_to be nil
    expect(Contrast::UserApi::VERSION).to match /[\d]+\.[\d]+\.[\d]+/
  end
end
