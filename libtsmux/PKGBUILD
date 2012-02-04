# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=libtsmux
pkgver=0.2.0
pkgrel=1
pkgdesc="A C library for muxing files into the MPEG Transport Stream container format"
arch=('i686' 'x86_64')
url="http://schrodinger.sourceforge.net/"
license=('GPL' 'LGPL' 'MIT' 'MPL')
depends=('glib2')
makedepends=('pkgconfig>=0.9')
options=('!libtool')
source=(http://downloads.sourceforge.net/schrodinger/$pkgname-$pkgver.tar.bz2)
md5sums=('592721392670e3267faf267adcc76e66')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --disable-static
  make || return 1
  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING.MIT "$pkgdir"/usr/share/licenses/$pkgname/COPYING.MIT
}
