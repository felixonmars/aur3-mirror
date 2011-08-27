# Contributor: noonov <noonov@gmail.com>

pkgname=kasumi
pkgver=2.5
pkgrel=1
pkgdesc="A dictionary management tool for Anthy"
arch=('i686' 'x86_64')
url="http://kasumi.sourceforge.jp/"
license=('GPL2')
depends=('gtk2' 'anthy')
makedepends=('pkgconfig')
source=(http://osdn.dl.sourceforge.jp/kasumi/41436/kasumi-2.5.tar.gz)

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

md5sums=('f49d010cf1fa5672b4515502b961b8c8')
