 define riofs::config ( $aws_access_key_id, 
                       $aws_secret_access_key ) {

   if ( ( $aws_access_key_id == undef ) and ( $aws_secret_access_key == undef ) ) {
        fail ("Failed aws key parameters $aws_access_key_id $aws_secret_access_key not given")        
   }

   file { 'riofs-conf-xml': 
       path => '/root/.config/riofs/riofs.conf.xml',
       content => template('riofs/riofs.conf.xml.erb'),
       ensure => present,
   }   

}
