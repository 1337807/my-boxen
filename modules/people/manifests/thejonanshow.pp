class people::thejonanshow (
  $projects = {},
  $private_projects = {},
) {
  include projects::personal
  include fonts::powerline

  create_resources(boxen::project, $projects)
  create_resources(boxen::project, $private_projects)

  $home       = "/Users/${::boxen_user}"
  $src        = "${home}/src"
  $dotvim     = "${src}/dotvim"
  $powerline  = "${src}/powerline-shell"
  $dotfiles   = "${src}/dotfiles"
  $itermplist = "${home}/Library/Preferences/com.googlecode.iterm2.plist"
  $divvyplist = "${home}/Library/Preferences/com.mizage.direct.Divvy.plist"

  osx::recovery_message { 'If found call 503-985-6626, email jonanscheffler@gmail.com or tweet @thejonanshow': }

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

  homebrew::tap {
    'nviennot/tmate':
    } -> package { 'tmate':
    ensure => present,
  }

  git::config::global {
    'alias.hist':
      value => "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
    'alias.pushf':
      value => "push --force-with-lease";
    'alias.put':
      value => "push -u";
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
      value => 'jonan@heroku.com';
    'user.name':
      value => 'Jonan Scheffler';
    'push.default':
      value => 'current';
  }

  repository { $dotvim:
    source  => "thejonanshow/dotvim",
    path    => $dotvim,
    require => File["${src}"]
  }

  repository { $powerline:
    source  => "thejonanshow/powerline-shell",
    path    => $powerline,
    require => File["${src}"]
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

  file { "${home}/.local_scripts":
    ensure => "directory"
  }

  file { "${home}/.ackrc":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/ackrc",
    require => Repository[$dotfiles]
  }

  file { "${home}/.aliases":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/aliases",
    require => Repository[$dotfiles]
  }

  file { "${home}/.agignore":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/agignore",
    require => Repository[$dotfiles]
  }

  file { "${home}/.bash_profile":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/bash_profile",
    require => Repository[$dotfiles]
  }

  file { "${home}/.bash_prompt":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/bash_prompt",
    require => Repository[$dotfiles]
  }

  file { "${home}/.bash_scripts":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/bash_scripts",
    require => Repository[$dotfiles]
  }

  file { "${home}/.exports":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/exports",
    require => Repository[$dotfiles]
  }

  file { "${home}/.functions":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/functions",
    require => Repository[$dotfiles]
  }

  file { "${home}/.gitignore":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/gitignore",
    require => Repository[$dotfiles]
  }

  file { "${home}/.inputrc":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/inputrc",
    require => Repository[$dotfiles]
  }

  file { "${home}/.irbrc":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/irbrc",
    require => Repository[$dotfiles]
  }

  file { "${home}/.my.cnf":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/my.cnf",
    require => Repository[$dotfiles]
  }

  file { "${home}/.pryrc":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/pryrc",
    require => Repository[$dotfiles]
  }

  file { "${home}/.vim":
    ensure  => link,
    force   => true,
    target  => $dotvim,
    require => Repository[$dotfiles]
  }

  file { "${home}/.wgetrc":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/wgetrc",
    require => Repository[$dotfiles]
  }

  file { "${home}/bin":
    ensure  => link,
    force   => true,
    target  => "${dotfiles}/bin",
    require => Repository[$dotfiles]
  }

  exec { "iterm_installed":
    command => "/usr/bin/true",
    onlyif  => "test -e ${itermplist}"
  }

  file { "install_custom_iterm_config":
    ensure  => file,
    path    => $itermplist,
    content => template('people/com.googlecode.iterm2.plist.erb'),
    require => Exec["iterm_installed"]
  }

  exec { "convert_iterm_xml_to_plist":
    command => "plutil -convert binary1 ${itermplist}",
    require => File["install_custom_iterm_config"]
  }

  exec { "divvy_installed":
    command => "/usr/bin/true",
    onlyif  => "test -e ${divvyplist}"
  }

  file { $divvyplist:
    ensure  => file,
    source  => "${dotfiles}/divvy/com.mizage.direct.Divvy.plist",
    require => Exec["divvy_installed"]
  }

  exec { "convert_divvy_xml_to_plist":
    command => "plutil -convert binary1 ${home}/Library/Preferences/com.mizage.direct.Divvy.plist",
    require => File[$divvyplist]
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
