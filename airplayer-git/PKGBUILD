# Contributor: Nicolas Quiénot < niQo at aur > 

_pkgname=airplayer
pkgname=airplayer-git
pkgver=0.47.cb6f6a3
pkgrel=1
epoch=1
pkgdesc='Python script to make media playing software Apple Airplay compatible. Currently supports XBMC, Plex and Boxee.'
arch=('any')
url='https://github.com/PascalW/Airplayer'
license=('GPL')
makedepends=('git')
depends=('python2' 'python-simplejson' 'pybonjour' 'python-tornado')
#install=${pkgname}.install
provides=('airplayer')
conflicts=('airplayer')
source=('airplayer::git://github.com/PascalW/Airplayer.git#branch=master')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
  cd "$srcdir/$_pkgname"

  mkdir -p $pkgdir/usr/lib/python2.7/site-packages/
  mkdir -p $pkgdir/usr/bin/
  cp -r airplayer $pkgdir/usr/lib/python2.7/site-packages/

  echo "#!/bin/sh" > $pkgdir/usr/bin/airplayer
  echo "python2 /usr/lib/python2.7/site-packages/airplayer/airplayer.py" >> $pkgdir/usr/bin/airplayer
  chmod +x $pkgdir/usr/bin/airplayer

  install -Dm644 README.mdown ${pkgdir}/usr/share/doc/${pkgname}/README
}

