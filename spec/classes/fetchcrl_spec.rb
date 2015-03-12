require 'spec_helper'

describe 'fetchcrl' do

  it { should contain_class('fetchcrl::install') }
  it { should contain_class('fetchcrl::config') }
  it { should contain_class('fetchcrl::service') }

  it { should contain_package('fetch-crl') }
  it { should contain_file('/etc/fetch-crl.conf') }
end
