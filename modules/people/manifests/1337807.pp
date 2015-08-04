class people::1337807 (
  $projects = {},
  $private_projects = {},
) {
  include projects::personal

  create_resources(boxen::project, $projects)
  create_resources(boxen::project, $private_projects)

  $home     = '/Users/jonan'
  $dotvim   = "${home}/src/dotvim"
  $dotfiles = "${home}/src/dotfiles"
  $ohmyfish = "${home}/src/oh-my-fish"

  osx::recovery_message { 'If found call 503-985-6626, email jonanscheffler@gmail.com or tweet @1337807': }

  include osx::global::disable_key_press_and_hold
  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::disable_autocorrect
  include osx::global::natural_mouse_scrolling

  include osx::finder::empty_trash_securely
  include osx::finder::show_hidden_files
  include osx::finder::enable_quicklook_text_selection
  include osx::finder::show_warning_before_emptying_trash

  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::software_update

  class { 'osx::mouse::button_mode':
    mode => 2
  }

  class { 'osx::global::key_repeat_delay':
    delay => 15
  }

  class { 'osx::global::key_repeat_rate':
    rate => 2
  }

  class { 'osx::sound::interface_sound_effects':
    enable => false
  }

  class { 'osx::dock::hot_corners':
    top_right => "Start Screen Saver",
  }

  class { 'osx::mouse::swipe_between_pages':
    enabled => true
  }

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

  exec { "omf_install_theme":
    command => "echo 'omf install theme' | /usr/local/bin/fish",
  }

  exec { "omf_install_bobthefish":
    command => "echo 'omf install bobthefish' | /usr/local/bin/fish",
  }

  file { "${home}/.config/fish/config.fish":
    ensure => link,
    force  => true,
    target => "${dotfiles}/fish/config.fish"
  }

  file { "${home}/.vim":
    ensure => link,
    force  => true,
    target => $dotvim
  }

  file { "${home}/bin":
    ensure => link,
    force  => true,
    target => "${dotfiles}/bin"
  }

  file { "${home}/.ackrc":
    ensure => link,
    force  => true,
    target => "${dotfiles}/ackrc"
  }

  file { "${home}/.agignore":
    ensure => link,
    force  => true,
    target => "${dotfiles}/agignore"
  }

  file { "${home}/.aliases":
    ensure => link,
    force  => true,
    target => "${dotfiles}/aliases"
  }

  file { "${home}/.gitignore":
    ensure => link,
    force  => true,
    target => "${dotfiles}/gitignore"
  }

  file { "${home}/.inputrc":
    ensure => link,
    force  => true,
    target => "${dotfiles}/inputrc"
  }

  file { "${home}/.irbrc":
    ensure => link,
    force  => true,
    target => "${dotfiles}/irbrc"
  }

  file { "${home}/.my.cnf":
    ensure => link,
    force  => true,
    target => "${dotfiles}/my.cnf"
  }

  file { "${home}/.pryrc":
    ensure => link,
    force  => true,
    target => "${dotfiles}/pryrc"
  }

  file { "${home}/.wgetrc":
    ensure => link,
    force  => true,
    target => "${dotfiles}/wgetrc"
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
