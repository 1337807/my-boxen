class projects::heaven {
  package { [ 'sqlite3' ]: }

  boxen::project { 'heaven':
    ruby       => '2.1.2',
    redis      => true,
    postgresql => true,
    source     => 'atmos/heaven'
  }
}
