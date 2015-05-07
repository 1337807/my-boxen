class projects::camo {
  boxen::project { 'camo':
    dir    => '~/p/camo',
    dotenv => true,
    nodejs => 'v0.10.29',
    source => 'atmos/camo'
  }
}
