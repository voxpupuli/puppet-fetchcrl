require 'spec_helper'
describe 'fetchcrl', type: 'class' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'with defaults for all parameters' do
        it { is_expected.to contain_class('fetchcrl') }
        it { is_expected.to contain_class('fetchcrl::install') }
        it { is_expected.to contain_class('fetchcrl::config') }
        it { is_expected.to contain_class('fetchcrl::service') }
        it { is_expected.to contain_package('fetch-crl') }
        it { is_expected.to contain_file('/etc/fetch-crl.conf').without_content(%r{cache_control_request}) }
        it { is_expected.to contain_file('/etc/fetch-crl.conf').without_content(%r{noerrors}) }
      end
      context 'with all parameters set' do
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
      context 'with noerrors parameters set' do
        let(:params) do
          {
            noerrors: true
          }
        end

        it { is_expected.to contain_file('/etc/fetch-crl.conf').with_content(%r{^noerrors$}) }
      end
    end
  end
end
