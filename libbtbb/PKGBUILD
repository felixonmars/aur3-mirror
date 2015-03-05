pkgname=libbtbb
pkgver=2014.02.R4
pkgrel=1
pkgdesc="A library to decode Bluetooth baseband packets, as produced by the Ubertooth and GR-Bluetooth projects."
url="http://sourceforge.net/projects/libbtbb/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('python')
source=("https://github.com/greatscottgadgets/libbtbb/archive/2014-02-R4.tar.gz")
md5sums=('27354030057117487f48f1f3779b99c8')

build() {
  cd "${srcdir}/${pkgname}-2014-02-R4"
  mkdir -p build
  cd build
  cmake -DINSTALL_DIR=/usr/lib -DINCLUDE_DIR=/usr/include -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-2014-02-R4/build"
  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/include
  make install
}

