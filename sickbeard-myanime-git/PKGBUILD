# Maintainer: sharktamer

pkgname=sickbeard-myanime-git
pkgver=20120610
pkgrel=1
pkgdesc="A PVR application that downloads and manages your TV shows. Anime branch, adding support for the fanzub indexer."
arch=(any)
url="http://sickbeard.com/forums/viewtopic.php?f=4&t=1452"
license=(GPL3)
depends=(python2 python2-cheetah)
makedepends=(git)
optdepends=('sabnzbd: NZB downloader'
				'python-notify: desktop notifications')
backup=(etc/conf.d/sickbeard)
install=sickbeard.install
conflicts=(sickbeard)
source=('sickbeard' 'sickbeard.init' 'sickbeard.confd')
md5sums=('873799bc75eabd3a9c74e9cf208fc3cb'
         '57b8d14e686c821c38a0c272f68657be'
         '34288612400b8928604fba7b42bfbec9')

_gitroot="git://github.com/lad1337/Sick-Beard.git"
_gitname="Sick-beard"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ]; then
     cd $_gitname && git pull origin
     msg "The local files are updated."
  else
     git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting install..."
}

package() {
  mkdir -p "${pkgdir}/opt/"
  cp -r "$srcdir/$_gitname" "${pkgdir}/opt/sickbeard"

  sed -i 's/python/python2/g' "${pkgdir}/opt/sickbeard/autoProcessTV/sabToSickBeard.py"
  sed -i 's/python/python2/g' "${pkgdir}/opt/sickbeard/autoProcessTV/hellaToSickBeard.py"

  install -D -m755 "${srcdir}/sickbeard" "${pkgdir}/usr/bin/sickbeard"
  install -D -m755 "${srcdir}/sickbeard.init" "${pkgdir}/etc/rc.d/sickbeard"
  install -D -m644 "${srcdir}/sickbeard.confd" "${pkgdir}/etc/conf.d/sickbeard"
}
