# frozen_string_literal: true

# == Fact: certissuer
# From fetchcrl module.
# Fact supplies the issuer of grid grid certificate if it exists.
if File.exist?('/etc/grid-security/hostcert.pem')
  Facter.add('certissuer') do
    setcode do
      Facter::Util::Resolution.exec('/usr/bin/openssl x509 \
       -in /etc/grid-security/hostcert.pem \
       -noout -subject -issuer -nameopt RFC2253|\
        /bin/grep issuer| /bin/cut -d= -f 2-20')
    end
  end
end
