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
      it { is_expected.to contain_file('/etc/foo.d/myinstance.conf') }
      it { is_expected.to contain_file('/etc/foo.d/myinstance.conf').with_content(%r{\[myinstance\]}) }
      it { is_expected.to contain_file('/etc/foo.d/myinstance.conf').without_content(%r{^agingtolerance$}) }
      it { is_expected.to contain_file('/etc/foo.d/myinstance.conf').without_content(%r{^nowarnings$}) }
      it { is_expected.to contain_file('/etc/foo.d/myinstance.conf').without_content(%r{^noerrors$}) }
      it { is_expected.to contain_file('/etc/foo.d/myinstance.conf').without_content(%r{^httptimeout$}) }
      it { is_expected.to contain_file('/etc/foo.d/myinstance.conf').without_content(%r{^crl_url$}) }
      context 'with all booleans false' do
        let(:params) do
          {
            nowarnings: false,
            noerrors: false
          }
        end

        it { is_expected.to contain_file('/etc/foo.d/myinstance.conf').without_content(%r{^nowarnings$}) }
        it { is_expected.to contain_file('/etc/foo.d/myinstance.conf').without_content(%r{^noerrors$}) }
      end
      context 'with all booleans true' do
        let(:params) do
          {
            nowarnings: true,
            noerrors: true
          }
        end

        it { is_expected.to contain_file('/etc/foo.d/myinstance.conf').with_content(%r{^nowarnings$}) }
        it { is_expected.to contain_file('/etc/foo.d/myinstance.conf').with_content(%r{^noerrors$}) }
      end
      context 'with all parameters set' do
        let(:params) do
          {
            nowarnings: true,
            noerrors: true,
            httptimeout: 1234,
            agingtolerance: 9876,
            crl_url: ['http://ca1.example.org/', 'http://ca2.example.org/']
          }
        end

        it { is_expected.to contain_file('/etc/foo.d/myinstance.conf').with_content(%r{^nowarnings$}) }
        it { is_expected.to contain_file('/etc/foo.d/myinstance.conf').with_content(%r{^noerrors$}) }
        it { is_expected.to contain_file('/etc/foo.d/myinstance.conf').with_content(%r{^agingtolerance = 9876$}) }
        it { is_expected.to contain_file('/etc/foo.d/myinstance.conf').with_content(%r{^httptimeout = 1234$}) }
        it { is_expected.to contain_file('/etc/foo.d/myinstance.conf').with_content(%r{^crl_url.1 = http://ca1.example.org/;http://ca2.example.org/$}) }
      end
    end
  end
end
