# Maintainer: Lance Hartung <lhartung AT wisc DOT edu>
pkgname=lam
pkgver=7.1.4
pkgrel=1
pkgdesc="Local Area Multicomputer is an MPI programming environment and development system for heterogeneous computers on a network"
arch=('i686' 'x86_64')
url="http://www.lam-mpi.org/"
license=('custom')
depends=('gcc')
options=('!libtool' '!emptydirs')
source=("http://www.lam-mpi.org/download/files/$pkgname-$pkgver.tar.bz2")
md5sums=('3f9240327fae75b1de479ae3f3e2c31a');

build() {
  cd "$srcdir/$pkgname-$pkgver"

# Using ssh by default instead of rsh
# Compiling without support for fortran
  ./configure --prefix="/usr" --with-rsh="ssh -x" --without-fc

  make || return 1
  make DESTDIR="$pkgdir" install

  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

# Removing wipe symlink as it conflicts with wipe package
# The command was renamed to lamwipe
  rm $pkgdir/usr/bin/wipe
}

