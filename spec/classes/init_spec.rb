require 'spec_helper'

os_fixtures = @os_fixtures

describe 'fetchcrl' do
  context 'supported operating systems' do
    os_fixtures.each do |osname, osfixtures|
      describe "without any parameters" do
        let(:params) {{ }}
        describe "on #{osname}" do
          let(:facts) do
            osfixtures[:facts]
          end
          it { should compile.with_all_deps }
          it { should contain_class('fetchcrl') }
          it { should contain_class('fetchcrl::params') }
          it { should contain_class('fetchcrl::config') }
          it { should contain_class('fetchcrl::install').that_comes_before('fetchcrl::config') }
          it { should contain_class('fetchcrl::service').that_subscribes_to('fetchcrl::config') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'without any parameters' do
      let(:params) {{ }}
      describe 'on AmigaOS' do
        let(:facts) do
          {
            :osfamily        => 'Commodore',
            :operatingsystem => 'AmigaOS',
          }
        end
        it { expect { should contain_class('fetchcrl::params') }.to raise_error(Puppet::Error, /osfamily `Commodore` not supported/) }
      end
      describe 'on Scientific Linux 5' do
        let(:facts) do
          {
            :osfamily => 'RedHat',
            :operatingsystem => 'Scientific',
            :operatingsystemmajrelease => 5
          }
        end
        it { expect { should contain_class('fetchcrl::params') }.to raise_error(Puppet::Error, /operatingsystemmajrelease `5` not supported/) }
      end
    end
  end
end

# vim: ft=ruby
