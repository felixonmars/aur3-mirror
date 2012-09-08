# Contributor: Nicolas Quiénot < niQo at aur > 

pkgname=xbmc-eventclient-xbmc-send
pkgver=20120908
pkgrel=1
pkgdesc='XBMC Event server'
arch=('any')
url='http://wiki.xbmc.org/?title=EventServer'
license=('GPL')
makedepends=('git')
depends=('python2') 

_gitroot=git://github.com/xbmc/xbmc.git
_gitname=xbmc/tools/EventClients

build() {
    cd "$srcdir"

    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
        cd $_gitname
    fi

  msg "Starting make..."

}

package() {
  cd "$srcdir/$_gitname"

  mkdir -p {$pkgdir/usr/lib/python2.7/site-packages/xbmc/,$pkgdir/usr/share/pixmaps/xbmc/,$pkgdir/usr/bin/}
  cp -r lib/python/* ${pkgdir}/usr/lib/python2.7/site-packages/xbmc/
  cp -r icons/ ${pkgdir}/usr/share/pixmaps/xbmc/
  echo "ICON_PATH="/usr/share/pixmaps/xbmc/"" >> ${pkgdir}/usr/lib/python2.7/site-packages/xbmc/defs.py
  sed -i -e 's|#!/usr/bin/python$|#!/usr/bin/python2|' Clients/XBMC\ Send/xbmc-send.py 
  install -Dm755 Clients/XBMC\ Send/xbmc-send.py ${pkgdir}/usr/bin/xbmc-send || return 1
}

