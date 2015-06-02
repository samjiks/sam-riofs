# == Class: riofs
#
# Full description of class riofs here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'riofs':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <aws.samuel@gmail.com>
#
# === Copyright
#
# Copyright 2015 Samuel Thampy, unless otherwise noted.
#

class riofs (

     $packages_ensure       = $packages_ensure,
     $aws_access_key_id     = $aws_access_key_id,
     $aws_secret_access_key = $aws_secret_access_key,

     $aws_bucket_name       = $aws_bucket_name, 
     $path_to_mount         = $path_to_mount,
#    $options               = $riofs::params::options,  
#    $allow_other_fuse      = $riofs::params::allow_other_fuse,
        
) {
  
     riofs::install { '$packages_ensure':
          packages_ensure       => $packages_ensure, 
          aws_access_key_id     => $aws_access_key_id,
          aws_secret_access_key => $aws_secret_access_key,
          aws_bucket_name       => $aws_bucket_name,
          path_to_mount         => $path_to_mount, 
     } 
     
}
