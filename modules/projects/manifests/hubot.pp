class projects::hubot {
  boxen::project { 'hubot':
    nodejs => 'v0.10.29',
    source => 'github/hubot'
  }
}

class projects::hubot_deploy {
  boxen::project { 'hubot-deploy':
    nodejs => 'v0.10.29',
    source => 'atmos/hubot-deploy'
  }
}

class projects::hubot_auto_deploy {
  boxen::project { 'hubot-auto-deploy':
    nodejs => 'v0.10.29',
    source => 'atmos/hubot-auto-deploy'
  }
}

class projects::hubot_gtalk {
  boxen::project { 'hubot-gtalk':
    nodejs => 'v0.10.29',
    source => 'atmos/hubot-gtalk'
  }
}
