class { 'r10k':
      remote        => 'https://github.com/gloppasglop/vagrant-scaleio.git',
      provider      => 'puppet_gem',
      puppet_master => false,
}
