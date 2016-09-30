require 'spec_helper_acceptance'

describe 'fetchcrl' do
  it 'configures and work with no errors' do
    pp = <<-EOS
      class{'fetchcrl':
      }
    EOS
    apply_manifest(pp, catch_failures: true)
    apply_manifest(pp, catch_changes: true)
    cmd = if fact('osfamily') == 'RedHat' && fact('operatingsystemmajrelease') == '5'
            'fetch-crl3'
          else
            'fetch-crl'
          end
    # We accept 1 as a return code also since there will be some failing CAs
    # out there in the wild.
    shell(cmd, acceptable_exit_codes: [0, 1])
    shell('ls /etc/grid-security/certificates/*.r0', acceptable_exit_codes: 0)
  end
end
