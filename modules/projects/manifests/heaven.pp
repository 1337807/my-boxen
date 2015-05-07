class projects::camo {
  boxen::project { 'camo':
    ruby       => '2.2.0',
    redis      => true,
    postgresql => true,
    source     => 'atmos/heaven'
  }
}
