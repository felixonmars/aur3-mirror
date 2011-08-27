# Contributor: Zerial <fernando@zerial.org>

pkgname=weewm
pkgver=0.0.2
pkgrel=1
pkgdesc="ultra-light window manager"
url="http://weewm.flashtux.org"
license="GPL"
depends=(libx11)
arch=('i686' 'x86_64')
source=(http://weewm.flashtux.org/download/$pkgname-$pkgver.tar.gz)
md5sums=('300eb52aba3bb1a75512874cbcbac684')
build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  make DESTDIR=$startdir/pkg install
}
