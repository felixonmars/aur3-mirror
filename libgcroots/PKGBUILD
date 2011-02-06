# Contributor: Orivej Desh <smpuj@bk.ru>
pkgname=libgcroots
pkgver=0.2.1
pkgrel=1
pkgdesc="Multi-architecture garbage collector supporting library"
arch=("i686" "x86_64")
url="http://code.google.com/p/sigscheme/wiki/libgcroots"
license=("custom:BSD")
depends=("glibc")
options=("!libtool")
source=("http://sigscheme.googlecode.com/files/libgcroots-$pkgver.tar.bz2")
md5sums=('f5fa9b60e506c70a041ef03ab26dbd18')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-gnu-ld
  make || return 1
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/libgcroots/COPYING"
}

