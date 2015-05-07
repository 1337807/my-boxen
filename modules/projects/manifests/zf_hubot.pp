class projects::zf_hubot {
  boxen::project { 'zf_hubot':
    nodejs => 'v0.10.29',
    source => 'ZeroFucks/zero-fucks-hubot'
  }
}
