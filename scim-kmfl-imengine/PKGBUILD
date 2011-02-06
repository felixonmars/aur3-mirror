# Contributor: Orivej Desh <smpuj@bk.ru>
pkgname=scim-kmfl-imengine
pkgver=0.9.8
pkgrel=1
pkgdesc="KMFL (Keyboard Mapping for Linux) SCIM input method"
arch=("i686" "x86_64")
url="http://kmfl.sourceforge.net/"
license=("GPL")
depends=("libxkbfile" "libkmfl" "gtk2" "scim")
source=("http://downloads.sourceforge.net/kmfl/$pkgname-$pkgver.tar.gz")
md5sums=('14bd9feb9bfffe01c6cfb6faf4a03ea4')
options=("!libtool")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

