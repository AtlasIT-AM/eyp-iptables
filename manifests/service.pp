class iptables::service (
                          $ensure ='running',
                          $enable=true,
                          $manage_docker_service=false,
                          $manage_service=true,
                        ) inherits iptables::params {

  validate_bool($manage_docker_service)
  validate_bool($manage_service)
  validate_bool($enable)

  if($::eyp_docker_iscontainer==undef or
    $::eyp_docker_iscontainer =~ /false/ or
    $manage_docker_service)
  {
    if($manage_service)
    {
      service { 'iptables':
        ensure  => $ensure,
        enable  => $enable,
        require => Package[$iptables::params::iptables_pkgs],
      }
    }
  }
}
