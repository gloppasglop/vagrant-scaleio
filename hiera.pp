class {'hiera':
  hierarchy => [
    'clientcert/%{clientcert}',
    'role/%{role}',
    'global',
  ],
  datadir   => '/etc/puppetlabs/code/environments/%{::environment}/hieradata',
}
