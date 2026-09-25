# frozen_string_literal: true

require 'spec_helper'

describe 'fetchcrl::ca' do
  let :pre_condition do
    'class { "fetchcrl": pkgname => "foo", }'
  end
  let(:title) { 'myinstance' }

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('fetchcrl') }

      it {
        is_expected.to contain_file('/etc/foo.d/myinstance.conf')
          .with_content(%r{\[myinstance\]})
          .without_content(%r{^agingtolerance$})
          .without_content(%r{^nowarnings$})
          .without_content(%r{^noerrors$})
          .without_content(%r{^nohttp_proxy$})
          .without_content(%r{^nohttps_proxy$})
          .without_content(%r{^httptimeout$})
          .without_content(%r{^crl_url$})
          .without_content(%r{noverify_nextupdate})
          .without_content(%r{noverify_lastupdate})
      }

      context 'with all booleans false' do
        let(:params) do
          {
            nowarnings: false,
            noerrors: false,
            noverify_nextupdate: false,
            noverify_lastupdate: false,
          }
        end

        it {
          is_expected.to contain_file('/etc/foo.d/myinstance.conf')
            .without_content(%r{^nowarnings$})
            .without_content(%r{^noerrors$})
            .without_content(%r{^nohttp_proxy$})
            .without_content(%r{^nohttps_proxy$})
            .without_content(%r{noverify_nextupdate})
            .without_content(%r{noverify_lastupdate})
        }
      end

      context 'with all booleans true' do
        let(:params) do
          {
            nowarnings: true,
            noerrors: true,
            nohttp_proxy: true,
            nohttps_proxy: true,
            noverify_nextupdate: true,
            noverify_lastupdate: true,
          }
        end

        it {
          is_expected.to contain_file('/etc/foo.d/myinstance.conf')
            .with_content(%r{^nowarnings$})
            .with_content(%r{^noerrors$})
            .with_content(%r{^nohttp_proxy$})
            .with_content(%r{^nohttps_proxy$})
            .with_content(%r{^noverify_nextupdate$})
            .with_content(%r{^noverify_lastupdate$})
        }
      end

      context 'with all parameters set' do
        let(:params) do
          {
            nowarnings: true,
            comment: 'My Comment',
            noerrors: true,
            httptimeout: 1234,
            agingtolerance: 9876,
            crl_url: ['http://ca1.example.org/', 'http://ca2.example.org/'],
          }
        end

        it {
          is_expected.to contain_file('/etc/foo.d/myinstance.conf')
            .with_content(%r{^nowarnings$})
            .with_content(%r{^# My Comment$})
            .with_content(%r{^noerrors$})
            .with_content(%r{^agingtolerance = 9876$})
            .with_content(%r{^httptimeout = 1234$})
            .with_content(%r{^crl_url.1 = http://ca1.example.org/;http://ca2.example.org/$})
        }
      end

      context 'with noverify_nextupdate true' do
        let(:params) { { noverify_nextupdate: true } }

        it {
          is_expected.to contain_file('/etc/foo.d/myinstance.conf')
            .with_content(%r{^noverify_nextupdate$})
            .without_content(%r{noverify_lastupdate})
        }
      end

      context 'with noverify_lastupdate true' do
        let(:params) { { noverify_lastupdate: true } }

        it {
          is_expected.to contain_file('/etc/foo.d/myinstance.conf')
            .with_content(%r{^noverify_lastupdate$})
            .without_content(%r{noverify_nextupdate})
        }
      end
    end
  end
end
