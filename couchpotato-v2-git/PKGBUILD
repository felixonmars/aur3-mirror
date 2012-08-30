# Maintainer: pearswj<wpearson01 at gmail dot com>

pkgname='couchpotato-v2-git'
pkgver=20120830
pkgrel=1
pkgdesc='CouchPotato V2 - automatic movie downloading via NZBs & torrents.'
arch=('any')
url='http://help.couchpota.to/discussions/v2'
license=('GPL')
depends=('python2')
makedepends=('git')
backup=('etc/conf.d/couchpotato-v2')
install='couchpotato-v2.install'
conflicts=('couchpotato-git')
source=('couchpotato-v2.confd' 'couchpotato-v2.init' 'couchpotato-v2.sh' 'couchpotato-v2.systemd')
md5sums=('cfc4bacce97e4a66c61c4dcb305a0c4f'
         '17001f56d31d9626369d285e2cc441d9'
         'bfbd669c5a6f3e58deff977fe92c08c3'
         'c0c04f2ea3594070d4d373e851919281')

_gitroot='git://github.com/RuudBurger/CouchPotatoServer.git'
_gitname='CouchPotatoServer'

build() {
  cd "$srcdir"
  msg 'Connecting to GIT server....'

  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git pull origin
    msg 'The local files are updated.'
  else
    git clone $_gitroot $_gitname
  fi

  msg 'GIT checkout done or server timeout'
}

package() {
  mkdir -p "${pkgdir}/opt/"
  # .git folder left intact - used by CouchPotato's self-updater
  cp -r "$srcdir/$_gitname" "${pkgdir}/opt/couchpotato-v2"

  install -D -m755 "${srcdir}/couchpotato-v2.sh" "${pkgdir}/usr/bin/couchpotato-v2"
  install -D -m755 "${srcdir}/couchpotato-v2.init" "${pkgdir}/etc/rc.d/couchpotato-v2"
  install -D -m644 "${srcdir}/couchpotato-v2.confd" "${pkgdir}/etc/conf.d/couchpotato-v2"
  install -D -m644 "${srcdir}/couchpotato-v2.systemd" "${pkgdir}/usr/lib/systemd/system/couchpotato-v2.service"
}
