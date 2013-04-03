# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=reduce
pkgver=3.16.111118
pkgrel=1
pkgdesc="Reduce is a program for adding hydrogens to a Protein DataBank (PDB) molecular structure file"
arch=(i386 x86_64)
url="http://kinemage.biochem.duke.edu/software/reduce.php"
license=(unknown)
makedepends=(gcc)
source=(http://kinemage.biochem.duke.edu/php/downlode.php?filename=/downloads/software/reduce31/${pkgname}.${pkgver}.src.zip)
md5sums=('5a9f540f7fd4493d721a99ac73ce51f8')

build() {
  cd "$srcdir/"
  make -B
}

package() {
  install -D ${srcdir}/reduce_src/reduce ${pkgdir}/usr/bin/reduce
}

# vim:set ts=2 sw=2 et:
