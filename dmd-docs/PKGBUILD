# Maintainer: Vitaly M. <jauthu@gmail.com>

pkgname=dmd-docs
pkgver=2.058
pkgrel=1
pkgdesc="The Digital Mars D documentation"
arch=('any')
url="http://dlang.org"
license=('unknown')
options=(!strip !zipman)
source=(https://github.com/downloads/D-Programming-Language/dmd/dmd.$pkgver.zip)
md5sums=('81a0fe7b635d3a38ecbefff6048a37fe')

package() {
  dest=$pkgdir/usr/share/doc/dmd/

  mkdir -p $dest

  cd $srcdir/dmd2/
  cp -r html $dest
}

# vim:set ts=2 sw=2 et:
