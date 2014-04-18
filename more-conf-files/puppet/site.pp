# Install git
package {'git': ensure => installed }

# Clone hadoop repository
exec {'clone-repository': 
	command => '/usr/bin/git clone https://github.com/sayden/hadoop-0.20.git /var/hadooptest',
	require => Package['git']
}

# Open Firewall ports
exec {'open-firewall':
	command =>'/usr/bin/service firewalld stop'
}

# Create hdfs dir
exec {'create-hdfs-dir':
	command => '/usr/bin/mkdir /var/hadooptest/hdfs',
	require => Exec['clone-repository']
}
