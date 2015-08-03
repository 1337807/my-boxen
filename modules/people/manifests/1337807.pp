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

  osx::recovery_message { 'If found: call 503-985-6626, email jonanscheffler@gmail.com, tweet @1337807': }

  include osx::global::enable_keyboard_control_access
  include osx::global::disable_key_press_and_hold
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::disable_autocorrect
  include osx::finder::empty_trash_securely
  include osx::finder::show_all_filename_extensions
  include osx::finder::no_file_extension_warnings
  include osx::disable_app_quarantine
  include osx::software_update
  include osx::global::key_repeat_delay
  include osx::global::key_repeat_rate
  include osx::global::natural_mouse_scrolling
}
