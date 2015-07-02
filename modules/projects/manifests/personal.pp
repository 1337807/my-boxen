# Class projects::personal
#
# WIP, likely to be moved to boxen::personal
#
# Usage:
#
#   include projects::personal
#
# Parameters:
#
#   projects
#     Array of github projects to include
#   includes
#     Array of puppet modules to include
#   casks
#     Array of brew-casks to include (aliased as osx_apps)
#   homebrew_packages
#     Array of homebrew packages to install
#   custom_projects
#     Hash of custom project names and parameters

class projects::personal (
  $projects = [],
  $private_projects = [],
  $includes = [],
  $casks = [],
  $osx_apps = undef,
  $homebrew_packages = [],
  $custom_projects = {},
  $rubies = [],
) {
  $project_classes = prefix($projects, 'projects::')
  class { $project_classes: }

  $private_project_classes = prefix($private_projects, 'projects::private::')
  class { $private_project_classes: }

  class { $includes: }

  $_casks = $osx_apps ? {
    undef   => $casks,
    default => $osx_apps
  }
  if count($_casks) > 0 { include brewcask }
  ensure_resource('package', $_casks, {
    'provider'        => 'brewcask',
    'install_options' => '--appdir=/Applications',
  })

  ensure_resource('package', $homebrew_packages, {
    'provider' => 'homebrew',
  })

  create_resources(boxen::project, $custom_projects)

  include ruby::global

  ruby::version { $rubies: }

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
