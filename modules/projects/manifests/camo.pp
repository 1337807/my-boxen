class projects::camo {
  boxen::project { 'camo':
    nodejs => 'v0.10.29',
    source => 'atmos/camo'
  }
}
