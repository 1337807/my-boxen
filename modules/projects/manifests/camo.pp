class projects::camo {
  boxen::project { 'camo':
    dotenv => true,
    nodejs => 'v0.10.29',
    source => 'atmos/camo'
  }
}
