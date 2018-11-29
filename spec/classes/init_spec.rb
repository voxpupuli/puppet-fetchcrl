require 'spec_helper'
describe 'fetchcrl', type: 'class' do
  context 'with defaults for all parameters' do
    let(:facts) do
      { osfamily: 'RedHat',
        operatingsystemmajrelease: '6' }
    end

    it { is_expected.to contain_class('fetchcrl') }
    it { is_expected.to contain_class('fetchcrl::install') }
    it { is_expected.to contain_class('fetchcrl::config') }
    it { is_expected.to contain_class('fetchcrl::service') }
    it { is_expected.to contain_package('fetch-crl') }
    it { is_expected.to contain_file('/etc/fetch-crl.conf').without_content(%r{cache_control_request}) }
  end
  context 'with all parameters set' do
    let(:facts) do
      { osfamily: 'RedHat',
        operatingsystemmajrelease: '6' }
    end
    let(:params) do
      {
        cache_control_request: 1234,
        capkgs: %w[abc def]
      }
    end

    it { is_expected.to contain_file('/etc/fetch-crl.conf').with_content(%r{^cache_control_request = 1234$}) }
    it { is_expected.to contain_package('abc').with_ensure('present') }
    it { is_expected.to contain_package('def').with_ensure('present') }
  end
end
