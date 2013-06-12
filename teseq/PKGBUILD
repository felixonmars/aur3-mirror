# Maintainer: Brandon Invergo <brandon@invergo.net>
pkgname=teseq
pkgver=1.1
pkgrel=1
pkgdesc="A program to analyze files that contain control characters and terminal control sequences"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/teseq"
license=('GPL3')
depends=('perl' 'sed')
checkdepends=('check')
options=()
install=$pkgname.install
source=("ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('70a06633c2e8faa1dd3c83e9df4f2a5e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/$pkgname"
  mv "$pkgdir/usr/libexec/teseq-post.sed" "$pkgdir/usr/share/$pkgname"
  rm -rf "$pkgdir/usr/libexec"
}

# vim:set ts=2 sw=2 et:
