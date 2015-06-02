define riofs::install 
(  
    $packages_ensure,
    $aws_access_key_id, 
    $aws_secret_access_key,
    $aws_bucket_name, 
    $path_to_mount,
)  {
     
   $packages_install =  ['build-essential', 'gcc', 'make', 'automake', 'autoconf', 'libtool', 'pkg-config', 'intltool', 'libglib2.0-dev', 'libfuse-dev', 'libxml2-dev', 'libevent-dev', 'libssl-dev', 'wget', 'unzip'] 
  
  if ! defined( Package[$package] ) {
      package { $packages_install: 
         ensure => $packages_ensure,
      }
  } else {
      notice( '$packages_install already instaled' )
  }
   exec { 'get_riofs': 
       command => 'wget https://github.com/skoobe/riofs/archive/master.zip', 
       cwd => '/opt',
       creates => '/opt/master.zip',
       path => $::path, 
       unless => 'ls /opt/master.zip',
       logoutput => 'on_failure',
   }

   file { '/opt/master.zip':
        mode => 0755,
        require => Exec['get_riofs'],
   }  


   exec { 'unzip-master':
       cwd     => '/opt',
       command => 'unzip master.zip',
       path    => $::path,
       unless  => 'ls /opt/riofs-master',
       require => [ File['/opt/master.zip'],  Exec['get_riofs'] ],
       logoutput => 'on_failure',
   }
   
   file { '/opt/riofs-master/autogen.sh':
         ensure  => file,
         mode    => 0755, 
         require => Exec['unzip-master'],
   }

   exec { 'autogen':
       cwd       => '/opt/riofs-master',
       command   => '/opt/riofs-master/autogen.sh',
       require   => Exec['unzip-master'],      
       path      => $::path,
       logoutput => 'on_failure',
   }
    
  file { '/opt/riofs-master/configure.sh':
        ensure => file,
        mode => 0755,
        require => Exec['unzip-master']
  }
  

   exec { 'configure':
        cwd       => '/opt/riofs-master',
        command   => '/opt/riofs-master/configure.sh', 
        path      => $::path,
        umask     => 755,
        logoutput => 'on_failure',
        require   => Exec['autogen'],  
   }

 
  exec { 'make-install':
       cwd       => '/opt/riofs-master',
       command   => '/usr/bin/make && make install /opt/riofs-master',
       timeout   => 1800,
      # path      => ['/usr/bin/'],
       logoutput => 'on_failure',  
       require   => Exec['configure'],
  }

   exec { 'create-folder':
         command  => '/bin/mkdir -p /root/.config/riofs',
         creates  => '/root/.config/riofs',
         require  => Exec['make-install'],
   }
   
   exec { 'move-conf-file':
          command => 'cp /usr/local/etc/riofs/riofs.conf.xml /root/.config/riofs/riofs.conf.xml',
          creates => '/root/.config/riofs/riofs.conf.xml',
          path    => $::path,
          require => Exec['create-folder'],
   }
  
  riofs::config { 'configuration':
        aws_access_key_id => $aws_access_key_id,
        aws_secret_access_key => $aws_secret_access_key,
  }
 
  #notice ($aws_bucket_name)
  #notice ($path_to_mount)

  riofs::mount { 'mount':
       aws_bucket_name => $aws_bucket_name,
       path_to_mount   => $path_to_mount,   
  }


}
