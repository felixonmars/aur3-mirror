# Contributor: Guillem Rieu <guillemr@gmx.net>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Zhukov Pavel <gelios@gmail.com>

pkgname=webmonx
pkgver=0.3.3
pkgrel=1
pkgdesc="A tool which monitors websites for updates and changes"
arch=('i686' 'x86_64')
url="http://debfx.fobos.de/webmonx/"
license=('GPL2')
depends=('qt')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('a4706a6a31d060a258cd56e5bd7450c3')

build() {
  cd $srcdir/$pkgname-$pkgver/
  qmake PREFIX="$pkgdir/usr" || return 1
  make || return 1
  make DESTDIR="$pkgdir" install
}
