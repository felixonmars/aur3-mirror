# Maintainer: Chuan Ji <jichuan89@gmail.com>
pkgname=prc-tools-arm-bin
pkgver=2.3
pkgrel=1
epoch=
pkgdesc='Add support to PRC-Tools for building ARM programs for Palm OS'
arch=('i686')
url='http://prc-tools.sourceforge.net/'
license=('GPL')
depends=('prc-tools-bin')
makedepends=('rpmextract')
source=('http://downloads.sourceforge.net/project/prc-tools/prc-tools/2.3/prc-tools-arm-2.3-1.i386.rpm')
md5sums=('dad8cf5ea0a3fdf0c4973fbee628a1e5')
options=('!strip')

package() {
  cd "$pkgdir"
  rpmextract.sh "$srcdir/prc-tools-arm-2.3-1.i386.rpm"
}
