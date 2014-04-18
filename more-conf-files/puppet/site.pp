# Install git
package {'git': ensure => installed }

# Clone hadoop repository
exec {'clone-repository': 
	command => '/usr/bin/git clone https://github.com/sayden/hadoop-0.20.git /var/hadoop',
	require => Package['git']
}

# Set the conf directory env variable
exec {'env-hadoop-conf':	
  environment => ["HADOOP_CONF_DIR=/var/hadoop/conf.aws"],
  command => "/bin/echo 'export HADOOP_CONF_DIR=$HADOOP_CONF_DIR' >> ~/.bashrc",
  require => Exec['clone-repository']
}

# Open Firewall ports
exec {'open-firewall':
	command =>'/usr/bin/service firewalld stop'
}

# Create hdfs dir
exec {'create-hdfs-dir':
	command => '/bin/mkdir /var/hadoop/hdfs',
	require => Exec['clone-repository']
}
