# Maintainer: Andreas Schnaiter <rc.poison@gmail.com>
pkgname=smtube
pkgver=1.7
pkgrel=1
pkgdesc="Search and download videos from YouTube"
arch=('i686' 'x86_64')
url="http://smplayer.sourceforge.net"
license=('GPL')
depends=('qt4' 'smplayer')
source=(http://downloads.sourceforge.net/smplayer/$pkgname-$pkgver.tar.bz2)

md5sums=('d9a954e1b337f0c850dcfc6063255056')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make QMAKE=qmake-qt4 LRELEASE=lrelease-qt4 PREFIX="/usr"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make QMAKE=qmake-qt4 LRELEASE=lrelease-qt4 PREFIX="/usr" DESTDIR="$pkgdir" install
}