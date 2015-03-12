require 'spec_helper'
describe 'fetchcrl' do

  context 'with defaults for all parameters' do
    it { should contain_class('fetchcrl') }
  end
end
