# Contributor: Orivej Desh <smpuj@bk.ru>
pkgname=kmflcomp
pkgver=0.9.8
pkgrel=1
pkgdesc="KMFL (Keyboard Mapping for Linux) compiler"
arch=("i686" "x86_64")
url="http://kmfl.sourceforge.net/"
license=("GPL")
depends=("libx11")
source=("http://downloads.sourceforge.net/kmfl/$pkgname-$pkgver.tar.gz")
md5sums=('d8d6a3163dae204079ccbb7c490d8ee7')
options=('!libtool')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir/usr/share"
  mv "$pkgdir/usr/doc" "$pkgdir/usr/share/"
}

