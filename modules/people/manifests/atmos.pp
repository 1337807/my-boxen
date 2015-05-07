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

  # I don't differentiate between login/non shells.
  file { ["${home}/.bash_profile", "${home}/.bashrc"]:
    ensure  => link,
    target  => "${dotfiles}/bash/main.sh",
    require => Repository[$dotfiles]
  }

  # Stuff I need from homebrew
  package { [ 'bash-completion', 'coreutils', 'ctags-exuberant', 'tmux' ]: }

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

  # ensure bundler is installed for all ruby versions
  ruby_gem { 'bundler for all rubies':
    gem          => 'bundler',
    version      => '~> 1.0',
    ruby_version => '*',
  }
  ruby_gem { 'heroku for all rubies':
    gem          => 'heroku',
    version      => '~> 3.36.0',
    ruby_version => '*',
  }
}
