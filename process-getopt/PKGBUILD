# Maintainer: Alfredo Palhares  <masterkorp@masterkorp,net>

pkgname=process-getopt
pkgver=1.0
pkgrel=1
pkgdesc="A getopts wrapper to make life easier"
arch=("any")
url="https://github.com/masterkorp/process-getopt"
license=('GPL')
depends=("bash")
source=($pkgname-$pkgver.tar.gz::https://github.com/masterkorp/process-getopt/tarball/v1.0)
md5sums=('b7747088eaad1244108be79296794e84') 

package() {
  cd "$srcdir/masterkorp-process-getopt-94394d6"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
