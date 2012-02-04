# Contributor: Orivej Desh <smpuj@bk.ru>
pkgname=libkmfl
pkgver=0.9.8
pkgrel=1
pkgdesc="KMFL (Keyboard Mapping for Linux) library"
arch=("i686" "x86_64")
url="http://kmfl.sourceforge.net/"
license=("GPL")
depends=("kmflcomp")
source=("http://downloads.sourceforge.net/kmfl/$pkgname-$pkgver.tar.gz")
md5sums=('913fcd6567ade43ea8ec112cda3675dd')
options=('!libtool')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir/usr/share"
  mv "$pkgdir/usr/doc" "$pkgdir/usr/share/"
}

