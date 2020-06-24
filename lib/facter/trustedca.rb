# == Fact: trustedcas
# From fetchcrl module.
# Fact supplies the issuer of grid grid certificate if it exists.
require 'openssl'

Facter.add('trustedca') do
  setcode do
    arr = []
    Dir.glob('/etc/grid-security/certificates/*.pem').each do |pem|
      begin
        cert = OpenSSL::X509::Certificate.new(File.read(pem))
      rescue
        next
      end
      subject = cert.subject.to_a
      # Array of arrays [CN,France,19] , last thing is type, hopefully we
      # can ignore that? I'm sure there must be a method in Certificate
      # for printing in rfc2449 format but I can't find it.
      rfc = subject.map { |x, y, _z| "#{x}=#{y}" }.reverse.join(',')
      arr.push(rfc)
    end
    arr
  end
end
