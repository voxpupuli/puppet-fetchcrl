# frozen_string_literal: true

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
        it { is_expected.to contain_file('/etc/fetch-crl.conf').without_content(%r{inet6glue}) }
        it { is_expected.to have_fetchcrl__ca_resource_count(0) }

        case facts[:os]['family']
        when 'Debian'
          it {
            expect(subject).to contain_apt__source('carepo').with(
              {
                location: 'https://repository.egi.eu/sw/production/cas/1/current/',
                key: { 'ensure' => 'refreshed', 'id' => '565F4528EAD3F53727B5A2E9B055005676341F1A', 'source' => 'https://repository.egi.eu/sw/production/cas/1/current/GPG-KEY-EUGridPMA-RPM-4R1' },
              }
            )
          }

          it { is_expected.not_to contain_yumrepo('carepo') }
        else
          it {
            expect(subject).to contain_yumrepo('carepo').with(
              {
                baseurl: 'https://repository.egi.eu/sw/production/cas/1/current/',
                gpgkey: 'https://repository.egi.eu/sw/production/cas/1/current/GPG-KEY-EUGridPMA-RPM-4R1',
              }
            )
          }

          it { is_expected.not_to contain_apt__source('carepo') }
        end

        it { is_expected.not_to contain_augeas('randomise_cron') }
        it { is_expected.not_to contain_service('fetch-crl-boot') }
        it { is_expected.not_to contain_service('fetch-crl-cron') }
        it { is_expected.to contain_service('fetch-crl.timer').with_ensure(true) }
        it { is_expected.to contain_service('fetch-crl.timer').with_enable(true) }
      end

      context 'with all parameters set' do
        let(:params) do
          {
            cache_control_request: 1234,
            capkgs: %w[abc def],
            carepo: 'https://example.org/foo',
            carepo_gpgkey: 'https://example.org/foo.gpg',
            cas: {
              'EDG' => {
                'agingtolerance' => 168,
              },
              'MD' => {
                'noerrors' => true,
              }
            }
          }
        end

        it { is_expected.to contain_file('/etc/fetch-crl.conf').with_content(%r{^cache_control_request = 1234$}) }
        it { is_expected.to contain_package('abc').with_ensure('present') }
        it { is_expected.to contain_package('def').with_ensure('present') }
        it { is_expected.to contain_fetchcrl__ca('EDG').with_agingtolerance(168) }
        it { is_expected.to contain_fetchcrl__ca('MD').with_noerrors(true) }

        case facts[:os]['family']
        when 'Debian'
          it {
            expect(subject).to contain_apt__source('carepo').with(
              {
                location: 'https://example.org/foo',
                key: { 'ensure' => 'refreshed', 'id' => '565F4528EAD3F53727B5A2E9B055005676341F1A', 'source' => 'https://example.org/foo.gpg' },
              }
            )
          }
        when 'RedHat'
          it {
            expect(subject).to contain_yumrepo('carepo').with(
              {
                baseurl: 'https://example.org/foo',
                gpgkey: 'https://example.org/foo.gpg',
              }
            )
          }
        end
      end

      context 'with boolean params parameters set true' do
        let(:params) do
          {
            noerrors: true,
            randomcron: true,
            runcron: true,
            manage_carepo: true,
            inet6glue: true,
          }
        end

        case facts[:os]['family']
        when 'Debian'
          it { is_expected.to contain_apt__source('carepo') }
          it { is_expected.to contain_package('libnet-inet6glue-perl').with_ensure('present') }
        else
          it { is_expected.to contain_yumrepo('carepo') }

          case facts[:os]['release']['major']
          when '8'
            it { is_expected.to contain_package('perl-Net-INET6Glue').with_ensure('present') }
          else
            it { is_expected.not_to contain_package('perl-Net-INET6Glue') }
          end
        end
        it { is_expected.to contain_file('/etc/fetch-crl.conf').with_content(%r{^noerrors$}) }

        case [facts[:os]['name'], facts[:os]['release']['major']]
        when %w[RedHat 8], %w[AlmaLinux 8], %w[OracleLinux 8], %w[Rocky 8], %w[Debian 11], ['Ubuntu', '22.04']
          it { is_expected.to contain_file('/etc/fetch-crl.conf').with_content(%r{^inet6glue$}) }
        else
          it { is_expected.not_to contain_file('/etc/fetch-crl.conf').with_content(%r{^inet6glue$}) }
        end

        it { is_expected.not_to contain_augeas('randomise_cron') }
        it { is_expected.to contain_service('fetch-crl.timer').with_ensure(true) }
        it { is_expected.to contain_service('fetch-crl.timer').with_enable(true) }
      end

      context 'with boolean params parameters set false' do
        let(:params) do
          {
            noerrors: false,
            randomcron: false,
            runcron: false,
            manage_carepo: false,
          }
        end

        it { is_expected.not_to contain_yumrepo('carepo') }
        it { is_expected.not_to contain_apt__source('carepo') }
        it { is_expected.to contain_file('/etc/fetch-crl.conf').without_content(%r{^noerrors$}) }
        it { is_expected.not_to contain_augeas('randomise_cron') }

        it { is_expected.to contain_service('fetch-crl.timer').with_ensure(false) }
        it { is_expected.to contain_service('fetch-crl.timer').with_enable(false) }
      end
    end
  end
end
