define iptables::rule (
                        $description              = $name,
                        $order                    = '42',
                        $ip_version               = '4',
                        $chain                    = 'INPUT',
                        $target                   = undef,
                        $goto                     = undef,
                        $reject_with              = undef,
                        $protocols                = [ 'tcp', 'udp' ],
                        $uid_owner                = undef,
                        $gid_owner                = undef,
                        $dport                    = undef,
                        $dport_range              = undef,
                        $source_addr              = undef,
                        $inverse_source_addr      = false,
                        $destination_addr         = undef,
                        $inverse_destination_addr = false,
                        $in_interface             = undef,
                        $inverse_in_interface     = false,
                        $out_interface            = undef,
                        $inverse_out_interface    = false,
                        $states                   = [],
                      ) {
  include ::iptables

  case $ip_version
  {
    '4':
    {
      if($iptables::params::iptablesrulesetfile_ipv4!=undef)
      {
        $target_file=$iptables::params::iptablesrulesetfile_ipv4
      }
      else
      {
        fail('currently unsupported')
      }
    }
    '6':
    {
      if($iptables::params::iptablesrulesetfile_ipv6!=undef)
      {
        $target_file=$iptables::params::iptablesrulesetfile_ipv6
      }
      else
      {
        fail('currently unsupported')
      }
    }
    default:
    {
      fail('not a supported IP protocol')
    }
  }

  concat::fragment { "iptables rule IPv${ip_version} - ${order} ${chain} ${inverse_in_interface} ${in_interface} ${inverse_out_interface} ${out_interface} ${protocols} ${dport} ${target} ${inverse_source_addr} ${source_addr} ${inverse_destination_addr} ${destination_addr} ${states}":
    target  => $target_file,
    order   => "10-${chain}-${order}",
    content => template("${module_name}/rule.erb"),
  }

}
