# Maintainer: Remi Gacogne <rgacogne-arch at coredump dot fr>
pkgname=ht-editor
pkgver=2.0.20
pkgrel=1
pkgdesc="An open source executable file editing tool that supports the MZ, PE and LE file formats including code analyzer."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/hte/"
license=('GPL')
depends=('ncurses' 'lzo2' 'libx11' 'gcc-libs')
source=(http://sourceforge.net/projects/hte/files/ht-source/ht-$pkgver.tar.bz2)
md5sums=('c59767cc6fff9ccc620de61633cd3658')
sha512sums=('ac6cf153783bde37a4cc0c1c087a1b284239c9ac20f0ad34d3389c4bdea0866f2a4a03fbd6ef3871d8c9312c005ad3ab9cc8f0de84134aa94103ae1c1768183d')

build() {
  cd "$srcdir/ht-$pkgver"
  ./configure --enable-release && make
}

package() {
  cd "$srcdir/ht-$pkgver"
  mkdir -p $pkgdir/usr/bin
  /usr/bin/install -c 'ht' "$pkgdir/usr/bin/ht"
}
