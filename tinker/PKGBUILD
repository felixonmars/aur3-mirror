# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Gabriele Lanaro <gabriele.lanaro@gmail..com>

pkgname=tinker
pkgver=6.3.3
pkgrel=2
pkgdesc="Software Tools for Molecular Design"
arch=('i686' 'x86_64')
url="http://dasher.wustl.edu/tinker/"
license=('Custom')
makedepends=('gcc-fortran')
source=("http://dasher.wustl.edu/tinker/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('c3ac8bd5b83b93894e123be319db8e8a')


build() {
  cd "$pkgname/source"

  msg2 "Compiling code"
  ./../linux/gfortran/compile.make
  msg2 "Making libraries"
  ./../linux/gfortran/library.make
  msg2 "Linking"
  ./../linux/gfortran/link.make
  mkdir ../bin
  msg2 "Renaming"
  ./../linux/gfortran/rename.make
}

package() {
  msg2 "Installing"
  mkdir -p $pkgdir/usr/bin/
  cp -dpr --no-preserve=ownership $pkgname/bin $pkgdir/usr/

  # Install license
  install -D -m644 $srcdir/$pkgname/doc/license.txt $pkgdir/usr/share/licenses/$pkgname/license

  # Install doc
  install -D -m644 $srcdir/$pkgname/doc/guide.pdf $pkgdir/usr/share/doc/$pkgname/guide.pdf

  # Rename binaries to avoid conflicts
  cd $pkgdir/usr/bin
  for bina in *
  do
      mv -v $bina "tinker-$bina"
  done
}

# vim:set ts=2 sw=2 et:
