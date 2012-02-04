# Contributor: Nicolas Quiénot < niQo at aur > 

pkgname=airplayer-git
pkgver=20110312
pkgrel=1
pkgdesc='Python script to make media playing software Apple Airplay compatible. Currently supports XBMC, Plex and Boxee.'
arch=('any')
url='https://github.com/PascalW/Airplayer'
license=('GPL')
makedepends=('git')
depends=('python2' 'python-simplejson' 'pybonjour' 'python-tornado')
#install=${pkgname}.install
provide=('airplayer')
backup=()
source=()

_gitroot="https://github.com/PascalW/Airplayer.git"
_gitname="airplayer"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

}

package() {
  cd "$srcdir/$_gitname-build"

  mkdir -p $pkgdir/usr/lib/python2.7/site-packages/
  mkdir -p $pkgdir/usr/bin/
  cp -r airplayer $pkgdir/usr/lib/python2.7/site-packages/

  echo "#!/bin/sh" > $pkgdir/usr/bin/airplayer
  echo "python2 /usr/lib/python2.7/site-packages/airplayer/airplayer.py" >> $pkgdir/usr/bin/airplayer
  chmod +x $pkgdir/usr/bin/airplayer

  install -Dm644 README.mdown ${pkgdir}/usr/share/doc/${pkgname}/README || return 1
}

