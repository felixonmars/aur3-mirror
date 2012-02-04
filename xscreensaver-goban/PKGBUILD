# $Id: PKGBUILD,v 1.12 2005/11/11 18:46:32 simo Exp $
# Maintainer: Jonathan Schaeffer <Joschaeffer@gmail.com>

pkgname=xscreensaver-goban
pkgver=1.1
pkgrel=2
pkgdesc="A goban screensaver replaying famous games of go"
url="http://draves.org/goban"
arch=('i686' 'x86_64')
license=('GPL')
depends=('xscreensaver')
source=(http://draves.org/goban/goban-${pkgver}.tar.gz)
md5sums=('d7a7c8e48a3bcff7e11feb8cbfc78d55')

build() {
  cd $startdir/src/goban-$pkgver
  ./configure --prefix=/usr
  # Can't change this with configure variables :
  sed -i -e "s/control-center\/screensavers/xscreensaver\/config/" Makefile
  make  || return 1
  mkdir -p ${pkgdir}/usr/lib/xscreensaver 
  mkdir -p ${pkgdir}/usr/share/goban
  mkdir -p ${pkgdir}/usr/share/xscreensaver/config
  install -c src/goban ${pkgdir}/usr/lib/xscreensaver/goban
  install  games/*   ${pkgdir}/usr/share/goban
  install -c goban.xml ${pkgdir}/usr/share/xscreensaver/config

}
