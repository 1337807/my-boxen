class projects::heaven {
  package { [ 'sqlite3' ]: }

  boxen::project { 'heaven':
    ruby       => '2.2.2',
    redis      => true,
    postgresql => true,
    source     => 'atmos/heaven'
  }
}
