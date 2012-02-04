# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=texwiz
pkgver=2.0.1
pkgrel=2
pkgdesc="A document creation wizard for LaTeX"
url='http://www.doebelin.org/nic/tools/texwiz/'
license=('GPL') 
arch=('i686' 'x86_64')
depends=('qt')

source=(http://www.doebelin.org/nic/tools/texwiz/Download/texwiz2-${pkgver}.tar.gz)

build() {
  cd $srcdir/${pkgname}2-$pkgver
  rm Makefile src/Makefile
  qmake
  make
}

package() {
  cd $srcdir/${pkgname}2-$pkgver
  install -d -m755 $pkgdir/usr/share
  install -d -m755 $pkgdir/usr/bin
  install -D -m755 src/texwiz2 $pkgdir/usr/bin/texwiz2
  cp -R debian/texwiz2/usr/share/{applications,doc,icons} $pkgdir/usr/share/ 
}

md5sums=('8b6d9d91325efeb593178aa182b81754')
