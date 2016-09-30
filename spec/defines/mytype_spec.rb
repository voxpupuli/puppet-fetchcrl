require 'spec_helper'

os_fixtures = @os_fixtures

describe 'fetchcrl::mytype' do
  context 'supported operating systems' do
    os_fixtures.each do |osname, osfixtures|
      describe "with title=mytitle" do
        let :title do
          'mytitle'
        end
        describe "without any parameters" do
          let(:params) {{ }}
          describe "on #{osname}" do
            let(:facts) do
              osfixtures[:facts]
            end
            it { should compile.with_all_deps }
            it { should contain_notify('fetchcrl::mytype mytitle()') }
          end
        end
        describe "with param myparam=awesome" do
          let(:params) {{ :myparam => 'awesome' }}
          describe "on #{osname}" do
            let(:facts) do
              osfixtures[:facts]
            end
            it { should compile.with_all_deps }
            it { should contain_notify('fetchcrl::mytype mytitle(awesome)') }
          end
        end
      end
    end
  end
end

# vim: ft=ruby
