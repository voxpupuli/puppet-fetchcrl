# == Fact: trustedcas
# From fetchcrl module.
# Fact supplies the issuer of grid grid certificate if it exists.

if File.exists?("/etc/grid-security/certificates")
  Facter.add('trustedcas') do
    setcode do
      Facter::Util::Resolution.exec('/bin/bash -c \'for file in /etc/grid-security/certificates/*.pem;  do /usr/bin/openssl x509  -noout -subject -nameopt RFC2253 -in $file; done | /bin/grep subject| /bin/cut -d= -f 2-20\'')
    end
  end
end
