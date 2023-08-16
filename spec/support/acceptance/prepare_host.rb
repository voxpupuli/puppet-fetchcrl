# frozen_string_literal: true

def prepare_host
  shell('yum install -y epel-release') if fact('os.family') == 'RedHat'
end
