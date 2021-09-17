require 'spec_helper_acceptance'

describe 'fetchcrl' do
  context 'with fetchcrl' do
    let(:pp) { 'class{"fetchcrl": }' }

    it 'configures and work with no errors' do
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
      # We accept 1 as a return code also since there will be some failing CAs
      # out there in the wild.
      shell('fetch-crl', acceptable_exit_codes: [0, 1])
      shell('ls /etc/grid-security/certificates/*.r0', acceptable_exit_codes: 0)
    end
    describe file('/etc/cron.d/fetch-crl') do
      case [fact('os.name'), fact('os.release.major')]
      when %w[CentOS 7], ['Ubuntu', '18.04'], %w[Debian 10]
        its(:content) { is_expected.to match %r{^([0-9]|[1-5][0-9]) [0-5]-23/6 \* \* \*.*$} }
      else
        it { is_expected.not_to exist }
      end
    end
  end
  context 'with fetchcrl and ipv6 and cas' do
    let(:pp) do
      '
               class{"fetchcrl":
                 inet6glue => true,
                 cas => {
                   "EDG" => { "noerrors" => true },
                   "MD"  => {
                      "anchorname" => "MyMD",
                      "agingtolerance" => 125,
                   },
                 }
               }
               '
    end

    it 'configures and work with no errors' do
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
      shell('fetch-crl', acceptable_exit_codes: [0, 1])
      shell('ls /etc/fetch-crl.d/EDG.conf', acceptable_exit_codes: 0)
      shell('ls /etc/fetch-crl.d/MyMD.conf', acceptable_exit_codes: 0)
      shell('ls /etc/grid-security/certificates/*.r0', acceptable_exit_codes: 0)
    end
  end
end
