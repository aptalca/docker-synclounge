(async () => {
  const fs = require('fs')

  const webHost = process.env.WEB_HOST || 'http://localhost:8088'
  const serverHost = process.env.SERVER_HOST || 'http://localhost:8089'
  const servers = [
    {
      name: 'LSIO Server',
      location: 'Self-Hosted',
      url: `${serverHost}/slserver`,
      image: 'https://avatars3.githubusercontent.com/u/12324908?s=200&v=4',
    }
  ]

  let settings = JSON.parse(fs.readFileSync('/app/synclounge/settings.json'))
  settings.accessUrl = webHost
  settings.serverroot = "/slserver"
  settings.servers = servers

  fs.writeFileSync('/app/synclounge/settings.json', JSON.stringify(settings, null, 2))
})()
