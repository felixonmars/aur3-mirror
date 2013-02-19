# Maintainer: Damian Nowak <damian.nowak@atlashost.eu>

pkgname='teamcity-agent'
pkgdesc='Continuous integration standalone agent'
pkgver='1'
pkgrel='1'
arch=('any')
url='http://www.jetbrains.com/teamcity/'
license=('unknown')
depends=('java-runtime')
install="$pkgname.install"
source=('teamcity-agent.service'
        'teamcity-agent.conf')
options=('!strip')
md5sums=('cf1268c622908047db1cc0f5987ad4ca'
         '53f0fa40d75dff897ddb9abedde4dded')

# Replace YOURHOST with your TeamCity host (e.g. http://localhost:8111 or https://mysslteamcityserver.com)
# In case of problems, go to your TeamCity URL: /agents.html, copy URL of "Zip file distribution" link and paste it there.

_AGENT_URL='YOURHOST/update/buildAgent.zip'


build() {
  if [ -z "${_AGENT_URL}" ] || [ "${_AGENT_URL}" == 'YOURHOST/update/buildAgent.zip' ]; then
    echo 'Please edit PKGBUILD before installing.'
    exit 1
  fi

  cd "$srcdir"
  mkdir -p "$srcdir/agent"
  wget -c "${_AGENT_URL}" -O 'agent.zip'
  unzip 'agent.zip' -d 'agent'
  chmod +x "$srcdir/agent/bin"/*.sh

  install -Dm755 "${srcdir}/teamcity-agent.service" "${pkgdir}/usr/lib/systemd/system/teamcity-agent.service"
  install -Dm755 "${srcdir}/teamcity-agent.conf" "${pkgdir}/etc/conf.d/teamcity-agent"

  cd "$pkgdir"
  mkdir -p "$pkgdir/var/lib/teamcity-agent"
  mkdir -p "$pkgdir/opt/teamcity-agent"
  cp -r "$srcdir/agent"/* "$pkgdir/opt/teamcity-agent"
}
