# Maintainer: Chuan Ji <jichuan89@gmail.com>
pkgname=prc-tools-bin
pkgver=2.3
pkgrel=2
epoch=
pkgdesc='PRC Tools provide a custom GCC/Binutils toolchain for Palm OS'
arch=('i686' 'x86_64')
url='http://prc-tools.sourceforge.net/'
license=('GPL')
depends=()
makedepends=('rpmextract')
install='prc-tools.install'
source=('http://downloads.sourceforge.net/project/prc-tools/prc-tools/2.3/prc-tools-2.3-1.i386.rpm')
md5sums=('efd6ba91d23b5f5e67b3b2217dd74894')
options=('!strip')

package() {
  cd "$pkgdir"
  rpmextract.sh "$srcdir/prc-tools-2.3-1.i386.rpm"
}
