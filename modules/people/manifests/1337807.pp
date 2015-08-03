class people::1337807 (
  $projects = {},
  $private_projects = {},
) {
  include projects::personal

  create_resources(boxen::project, $projects)
  create_resources(boxen::project, $private_projects)

  $home     = '/Users/jonan'
  $dotfiles = "${home}/p/dotfiles"

  git::config::global {
    'alias.st':
      value => 'status';
    'alias.co':
      value => 'checkout';
    'alias.cp':
      value => 'cherry-pick';
    'alias.dc':
      value => 'diff --cached';
    'alias.lp':
      value => 'log -p';
    'alias.ro':
      value => '!git fetch origin --prune && git reset --hard origin/master';
    'apply.whitespace':
      value => 'fix';
    'color.ui':
      value => true;
    'color.interactive':
      value => true;
    'color.status':
      value => true;
    'color.branch':
      value => true;
    'color.diff':
      value => true;
    'core.whitespace':
      value => 'trailing-space,space-before-tab';
    'user.email':
      value => 'jonanscheffler@gmail.com';
    'user.name':
      value => 'Jonan Scheffler';
  }

  file {
    ["${home}/.vim/swapfiles"]:
      ensure => directory;
  }

  file {
    ["${home}/p"]:
      ensure => directory;
  }

  repository { $dotfiles:
    path    => $dotfiles,
    source  => '1337807/dotfiles',
    require => File["${home}/p"]
  }

  repository { $dotvim:
    path    => "${home}/p/dotvim",
    source  => "1337807/dotfiles",
    require => File["${home}/p"]
  }

  file { "${home}/.vimrc":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/vim/vimrc",
    require => Repository[$dotfiles]
  }

  file { "${home}/.gvimrc":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/vim/gvimrc",
    require => Repository[$dotfiles]
  }

  file { "${home}/.atom":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/atom",
    require => Repository[$dotfiles]
  }

  file { "${home}/.vim":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/vim/dotvim",
    require => Repository[$dotfiles]
  }

  file { "${home}/bin":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/bin",
    require => Repository[$dotfiles]
  }

  file { '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin':
    ensure => absent,
    force  => true
  }

  boxen::osx_defaults {
    'Disable auto-play on importing in iTunes':
      user   => $::luser,
      key    => 'play-songs-while-importing',
      domain => 'com.apple.iTunes',
      value  => false;
    'Minimize on Titlebar Double-Click':
      user   => $::luser,
      key    => 'AppleMiniaturizeOnDoubleClick',
      domain => 'NSGlobalDomain',
      value  => true;
  }
}
