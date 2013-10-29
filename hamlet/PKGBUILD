# Maintainer: perlawk
pkgname=hamlet
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="HaMLet is a faithful implementation of the Standard ML programming language (SML'97). It aims to be 1. an accurate reference implementation of the language specification, etc"
arch=('i686' 'x86_64')
url="http://www.polyml.org/"
license=('LGPL')
groups=()
options=('!libtool')
#depends=(smlnj)
#depends=( mosml )
depends=( mlton )
#depends=( polyml )
install=
source=("http://www.mpi-sws.org/~rossberg/hamlet/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"

#  make with-smlnj   
#  make with-mosml
  make with-mlton
#  make with-poly
}

package() {
	mkdir -p "$pkgdir/usr/lib/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALLDIR="$pkgdir/usr/lib/$pkgname" install
	echo "#!/usr/bin/bash" > "$pkgdir/usr/bin"/hamlet
	echo "/usr/lib/$pkgname/$pkgname" '$*' >> "$pkgdir/usr/bin"/hamlet
	chmod +x "$pkgdir/usr/bin"/hamlet
}

md5sums=('831610f1d4aa75d3d25bb92353450ba4')
