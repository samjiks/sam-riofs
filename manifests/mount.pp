define riofs::mount 
( 
    $aws_bucket_name, 
    $path_to_mount 
) {
 
   if ( $aws_bucket_name != undef or $path_to_mount != undef ) {   
       
     if ! defined( File[$path_to_mount] ) { 
           file { $path_to_mount: 
                ensure  => directory,
                recurse => true,
           }
     } else {
          fail ("Error: No path mount defined") 
     }
       notice ($aws_bucket_name, $path_to_mount)
     
      exec { 'mount-to-location':
           command   => "riofs -c /root/.config/riofs/riofs.conf.xml $aws_bucket_name $path_to_mount",
           logoutput =>  'on_failure',
           path      =>  '/usr/local/bin/',  
       }  
               
   } else {
      fail ('Either bucket name is not specified or mount path is not specified') 
   }

}
