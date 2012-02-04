# Contributor: nihui <https://twitter.com/nihui>

pkgname=choqok-weibo
pkgver=0.1
pkgrel=2
pkgdesc="Choqok plugins pack for weibo services in china"
url="http://kde-apps.org/content/show.php/choqok-weibo?content=147617"
license=('GPL')
arch=('i686' 'x86_64')
depends=('choqok')
makedepends=('cmake' 'automoc4')
install="${pkgname}.install"
source=("http://kde-apps.org/CONTENT/content-files/147617-${pkgname}-${pkgver}.tar.bz2"
	"userUrl.diff")
md5sums=('52c2fd1bfaf3420a11f03c0de50b8744'
	 '83dcf67b4513d5ad4f26b5229cc79c1d')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/choqok-sina

  patch -p1 < ../../userUrl.diff
  cd ../..

  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKWEBKITPART_LIBRARIES=/usr/lib/kde4/
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
