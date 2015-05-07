class projects::heaven {
  boxen::project { 'heaven':
    ruby       => '2.2.0',
    redis      => true,
    postgresql => true,
    source     => 'atmos/heaven'
  }
}
