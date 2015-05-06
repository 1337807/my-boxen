class projects::camo {
  boxen::project { 'camo':
    dotenv        => true,
    node          => '0.10.29',
    source        => 'atmos/camo'
  }
}
