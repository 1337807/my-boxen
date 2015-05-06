class projects::camo {
  boxen::project { 'camo':
    dir    => '~/p/camo',
    dotenv => true,
    nodejs => '0.10.29',
    source => 'atmos/camo'
  }
}
