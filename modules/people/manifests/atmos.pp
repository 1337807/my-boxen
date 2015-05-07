class people::atmos {
  include projects::all

  $home     = '/Users/atmos'
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
      value => 'atmos@atmos.org';
    'user.name':
      value => 'Corey Donohoe';
  }

  file {
    ["${home}/.vimswap"]:
      ensure => directory;
  }

  repository { $dotfiles:
    path    => $dotfiles,
    source  => 'atmos/dotfiles',
    require => File["${home}/p"]
  }

  file { ["${home}/.gvimrc", "${home}/.vimrc" ]:
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

  file { '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin':
    ensure => absent,
    force  => true
  }

  # I don't differentiate between login/non shells.
  file { ["${home}/.bash_profile", "${home}/.bashrc"]:
    ensure  => link,
    target  => "${dotfiles}/bash/main.sh",
    require => Repository[$dotfiles]
  }

  # Shit blows up if you try to install ctags twice :'( :'(
  # package { 'ctags-exuberant': }
  package { [ 'coreutils' ]: }
  #package {
  #  'Adium':
  #    provider => 'appdmg',
  #    source   => 'http://downloads.sourceforge.net/project/adium/Adium_1.5.3.dmg';
  #  'Plex':
  #    provider => 'compressed_app',
  #    source   => 'http://plex.r.worldssl.net/plex-laika/0.9.5.4/Plex-0.9.5.4-973998f.zip';
  #  'Skitch':
  #    provider => 'compressed_app',
  #    source   => 'http://f.cl.ly/items/0V0L2B0o2X3J380R353E/Skitch-1.0.12.zip';
  #}

  boxen::osx_defaults {
    'Disable auto-play on importing in iTunes':
      user   => $::luser,
      key    => 'play-songs-while-importing',
      domain => 'com.apple.iTunes',
      value  => false;
    'Securely Empty Trash':
      user   => $::luser,
      key    => 'EmptyTrashSecurely',
      domain => 'com.apple.finder',
      value  => true;
    'Disable Crazy Character Popup on hold':
      user   => $::luser,
      domain => 'NSGlobalDomain',
      key    => 'ApplePressAndHoldEnabled',
      value  => false;
    'Minimize on Titlebar Double-Click':
      user   => $::luser,
      key    => 'AppleMiniaturizeOnDoubleClick',
      domain => 'NSGlobalDomain',
      value  => true;
    'Put my Dock on the right':
      user   => $::luser,
      key    => 'orientation',
      domain => 'com.apple.dock',
      value  => 'right';
  }
}
