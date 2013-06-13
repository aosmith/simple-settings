require 'spec_helper'

describe 'stub' do
  before :each do
    SimpleSettings.file_path = "#{File.dirname(__FILE__)}/files/test.yml"
    SimpleSettings.env = "test"
  end
  it 'should pass' do
  end
  it 'should be able to open a settings file' do
    SimpleSettings.load
  end

  it 'should parse a settings file' do
    SimpleSettings.load
    SimpleSettings.config[:key].should be_eql("value")
    SimpleSettings.config[:nested].should be_a(Hash)
    SimpleSettings.config[:nested][:nested_key].should be_eql("nested value")
  end
end
