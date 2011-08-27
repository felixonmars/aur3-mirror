# Contributor: Guillem Rieu <guillemr@gmx.net>
pkgname=fuzz
pkgver=3.4.1
pkgrel=1
pkgdesc="fuzz is a collection of tools for working with Z specifications (LaTeX class, checker...)"
arch=('i686' 'x86_64')
url="http://spivey.oriel.ox.ac.uk/mike/fuzz/"
license=('MIT')
depends=('texlive-core')
install=fuzz.install
source=(http://spivey.oriel.ox.ac.uk/mike/fuzz/$pkgname-$pkgver.tgz)
md5sums=('abb703a693e024aa2aa8b27abafeeded')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  # Set the installation directories
  sed -i "s+/usr/local/+$startdir/pkg/usr/+g" Makefile
  sed -i "s+/usr/lib/tex/texmf/+$startdir/pkg/usr/share/texmf-dist/+g" Makefile
  sed -i 's+/usr/local/+/usr/+g' src/param.c
  # Cancel gcc optimizations since they produce an error
  export CFLAGS="${CFLAGS} -O0"

  make || return 1
  # Make directories
  mkdir -p $startdir/pkg/usr/{bin,lib}
  mkdir -p $startdir/pkg/usr/share/texmf-dist/{tex,fonts/source/local}
  # Install
  make DESTDIR="$startdir/pkg" install
}

# vim:set ts=2 sw=2 et:
