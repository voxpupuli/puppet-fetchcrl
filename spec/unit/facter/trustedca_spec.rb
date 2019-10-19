require 'spec_helper'

describe 'trustedca' do
  before { Facter.clear }

  context 'with no CAs installed' do
    it { expect(Facter.fact(:trustedca).value).to eq [] }
  end

  context 'with some traditional pem CAs installed' do
    before do
      cern = File.read(fixtures('certs', 'CERN-GridCA.pem'))
      allow(Dir).to receive(:glob).and_call_original
      allow(File).to receive(:read).and_call_original
      allow(Dir).to receive(:glob).with('/etc/grid-security/certificates/*.pem').and_return(
        ['/etc/grid-security/certificates/CERN-GridCA.pem']
      )
      allow(File).to receive(:read).with('/etc/grid-security/certificates/CERN-GridCA.pem').and_return(cern)
    end
    it { expect(Facter.fact(:trustedca).value).to eq ['CN=CERN Grid Certification Authority,DC=cern,DC=ch'] }
  end

  context 'with some invalid pem files installed' do
    before do
      arc = File.read(fixtures('certs', 'ARC-TestCA-6a8cca22-key.pem'))
      allow(Dir).to receive(:glob).and_call_original
      allow(File).to receive(:read).and_call_original
      allow(Dir).to receive(:glob).with('/etc/grid-security/certificates/*.pem').and_return(
        ['/etc/grid-security/certificates/ARC-TestCA-6a8cca22-key.pem']
      )
      allow(File).to receive(:read).with('/etc/grid-security/certificates/ARC-TestCA-6a8cca22-key.pem').and_return(arc)
    end
    it { expect(Facter.fact(:trustedca).value).to eq [] }
  end

  context 'with a value and an invalid pem files installed' do
    before do
      arc = File.read(fixtures('certs', 'ARC-TestCA-6a8cca22-key.pem'))
      cern = File.read(fixtures('certs', 'CERN-GridCA.pem'))
      allow(Dir).to receive(:glob).and_call_original
      allow(File).to receive(:read).and_call_original
      allow(Dir).to receive(:glob).with('/etc/grid-security/certificates/*.pem').and_return(
        [
          '/etc/grid-security/certificates/ARC-TestCA-6a8cca22-key.pem',
          '/etc/grid-security/certificates/CERN-GridCA.pem'
        ]
      )
      allow(File).to receive(:read).with('/etc/grid-security/certificates/ARC-TestCA-6a8cca22-key.pem').and_return(arc)
      allow(File).to receive(:read).with('/etc/grid-security/certificates/CERN-GridCA.pem').and_return(cern)
    end
    it { expect(Facter.fact(:trustedca).value).to eq ['CN=CERN Grid Certification Authority,DC=cern,DC=ch'] }
  end
end
