# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=ninjam_client
pkgver=0.01a
pkgrel=1
pkgdesc="A program to allow people to make real music together via the Internet; client side utility"
arch=("i686" "x86_64")
url="http://www.ninjam.com/"
license=('GPL')
depends=('gcc' 'ncurses' 'alsa-lib' 'libvorbis')
source=(http://www.ninjam.com/downloads/src/cclient_src_v${pkgver}.tar.gz Makefile.patch)
md5sums=('9ad6dd2ac68c9b548f52e2907a36eb29'
         'e68a4cd4a1d7fb28357094b016473bc3')

build() {
  patch $srcdir/ninjam/cursesclient/Makefile Makefile.patch
  cd $srcdir/ninjam/cursesclient
  make || return 1
  install -D -m755 cninjam $pkgdir/usr/bin/cninjam
}
