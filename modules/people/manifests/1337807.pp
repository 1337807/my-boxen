class people::1337807 (
  $projects = {},
  $private_projects = {},
) {
  include projects::personal

  create_resources(boxen::project, $projects)
  create_resources(boxen::project, $private_projects)

  $home     = '/Users/jonan'
  $dotvim   = "${home}/src/dotvim"
  $ohmyfish = "${home}/src/oh-my-fish"

  $dotfiles_to_link = [
    "ackrc",
    "agignore",
    "aliases",
    "gemrc",
    "gitconfig",
    "gitignore",
    "inputrc",
    "irbrc",
    "my.cnf",
    "pryrc",
    "wgetrc"
  ]

  git::config::global {
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
    'push.default':
      value => 'simple';
  }

  repository { $dotvim:
    source  => "1337807/dotvim"
  }

  repository { $ohmyfish:
    source  => "1337807/oh-my-fish"
  }

  package { 'VirtualBox':
      ensure => installed,
      source => 'http://download.virtualbox.org/virtualbox/5.0.0/VirtualBox-5.0.0-101573-OSX.dmg',
      provider => pkgdmg
  }

  package { 'TeamViewer':
      ensure => installed,
      source => 'http://download.teamviewer.com/download/TeamViewer.dmg',
      provider => pkgdmg
  }

  file { '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin':
    ensure => absent,
    force  => true
  }

  file { "${home}/.oh-my-fish":
    ensure => link,
    force  => true,
    target => $ohmyfish
  }

  file { "${home}/.oh-my-fish":
    ensure => link,
    force  => true,
    target => $ohmyfish
  }

  file { "${home}/bin":
    ensure => link,
    force  => true,
    target => "${dotfiles}/bin"
  }

  each($dotfiles_to_link) |$dotfile_to_link| {
    file { "${home}/.${dotfile_to_link}":
      ensure => link,
      force  => true,
      target => "${dotfiles}/${dotfile_to_link}"
    }
  }

  exec { 'rake-dotfiles':
    command => 'rake install:fish',
    require => $dotfiles,
    cwd     => $dotfiles
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
