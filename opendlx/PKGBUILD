# Maintainer: perlawk

pkgname=opendlx
_pkgname=openDLX
pkgver=1.0.6
_pkgver=1.0-6
pkgrel=1
pkgdesc="openDLX - A DLX/MIPS processor simulator."
arch=('any')
url="http://sourceforge.net/projects/opendlx/"
license=('Apache')
depends=('ant-doxygen' 'log4j')
source=("http://cznic.dl.sourceforge.net/project/opendlx/stable/${_pkgname}_v$_pkgver.zip"
'opendlx')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/java/opendlx"
  chmod +x run_openDLX.sh
  cp -a * "$pkgdir/usr/share/java/opendlx"
  cp opendlx "$pkgdir/usr/bin"
}
md5sums=('21eb22698102b3b0a9ac2a25ac79a0c2'
         'e34f530edc722017298afdfc4f51bdb2')
