require 'puppetlabs_spec_helper/module_spec_helper'

# common facts to all supported OS
# e.g. mocking concat_basedir can be handy

RSpec.configure do |c|
  c.default_facts = {
    :concat_basedir => '/DIR',
  }
end

# specific facts per supported OS
#

@os_fixtures = {
  'EL6'     => {
    :facts => {
      :operatingsystem      => 'Scientific',
      :osfamily             => 'RedHat',
      :operatingsystemmajrelease => 6
    },
    :params => {
      :global_param => 'foo',
      :profile_myprof_param => 'bar',
      :role_myrole_param => 'baz'
    }
  },
  'Debian8' => {
    :facts => {
      :operatingsystem     => 'Debian',
      :osfamily            => 'Debian',
      :operatingsystemmajrelease => 8
    },
    :params => {
      :global_param => 'foo',
      :profile_myprof_param => 'bar',
      :role_myrole_param => 'baz'
    }
  },
}

# add other combinations if you want to support a new OS e.g.
#
# 'MyOS-42' => @common_facts.merge({
#    :operatingsystem => 'OpenSolaris',
#    :osfamily => 'Solaris',
#    :operatingsystemmajrelease => 12
#  })

# If you want to fetch all values from hiera
#  e.g. because you're testing code that uses explicit hiera lookups
#
#RSpec.configure do |c|
#  c.hiera_config = 'spec/fixtures/hiera/hiera.yaml'
#end
