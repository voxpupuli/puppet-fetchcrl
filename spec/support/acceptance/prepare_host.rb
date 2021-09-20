def prepare_host
  shell('yum install -y epel-release') if fact('os.name') == 'CentOS'
end
