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
        case facts[:os]['release']['major']
        when '6', '7'
          it { is_expected.to contain_augeas('randomise_cron').with_incl('/etc/cron.d/fetch-crl') }
          it { is_expected.to contain_augeas('randomise_cron').with_changes([%r{set minute ([0-9]|[1-5][0-9])}, %r{set hour [0-5]-23/6}]) }
          it { is_expected.to contain_service('fetch-crl-boot').with_ensure(false) }
          it { is_expected.to contain_service('fetch-crl-boot').with_enable(false) }
          it { is_expected.to contain_service('fetch-crl-cron').with_ensure(true) }
          it { is_expected.to contain_service('fetch-crl-cron').with_enable(true) }
        else
          it { is_expected.not_to contain_augeas('randomise_cron') }
          it { is_expected.not_to contain_service('fetch-crl-boot') }
          it { is_expected.not_to contain_service('fetch-crl-cron') }
          it { is_expected.to contain_service('fetch-crl.timer').with_ensure(true) }
          it { is_expected.to contain_service('fetch-crl.timer').with_enable(true) }
        end
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
      context 'with boolean params parameters set true' do
        let(:params) do
          {
            noerrors: true,
            randomcron: true,
            runcron: true,
            runboot: true
          }
        end

        it { is_expected.to contain_file('/etc/fetch-crl.conf').with_content(%r{^noerrors$}) }
        case facts[:os]['release']['major']
        when '6', '7'
          it { is_expected.to contain_augeas('randomise_cron').with_incl('/etc/cron.d/fetch-crl') }
          it { is_expected.to contain_augeas('randomise_cron').with_changes([%r{set minute ([0-9]|[1-5][0-9])}, %r{set hour [0-5]-23/6}]) }
          it { is_expected.to contain_service('fetch-crl-boot').with_ensure(true) }
          it { is_expected.to contain_service('fetch-crl-boot').with_enable(true) }
          it { is_expected.to contain_service('fetch-crl-cron').with_ensure(true) }
          it { is_expected.to contain_service('fetch-crl-cron').with_enable(true) }
          it { is_expected.not_to contain_service('fetch-crl.timer') }
        else
          it { is_expected.not_to contain_augeas('randomise_cron') }
          it { is_expected.to contain_service('fetch-crl.timer').with_ensure(true) }
          it { is_expected.to contain_service('fetch-crl.timer').with_enable(true) }
        end
      end
      context 'with boolean params parameters set false' do
        let(:params) do
          {
            noerrors: false,
            randomcron: false,
            runcron: false,
            runboot: false
          }
        end

        it { is_expected.to contain_file('/etc/fetch-crl.conf').without_content(%r{^noerrors$}) }
        it { is_expected.not_to contain_augeas('randomise_cron') }
        case facts[:os]['release']['major']
        when '6', '7'
          it { is_expected.not_to contain_service('fetch-crl.timer') }
        else
          it { is_expected.to contain_service('fetch-crl.timer').with_ensure(false) }
          it { is_expected.to contain_service('fetch-crl.timer').with_enable(false) }
        end
      end
    end
  end
end
