# Maintainer: Peter Schneider <e.at.chi.kaen@gmail.com>

pkgname=gridlab-d
pkgver=2.3.1.4252M
pkgrel=1
pkgdesc="GridLAB-D is a new power system simulation tool that provides valuable information to users who design and operate electric power transmission and distribution systems, and to utilities that wish to take advantage of the latest smart grid technology."
url="http://sourceforge.net/projects/gridlab-d/"
license=('GPL')
makedepends=('rpmextract')
depends=()
arch=('x86_64')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/Last%20stable%20release/gridlabd-${pkgver}-1.x86_64.rpm)
md5sums=('2c0b245758f2e3d985134b8b5c021bd5')

build() {
  rpmextract.sh *.rpm
}

package() {
  cp -R "$srcdir"/usr "$pkgdir"/
}
