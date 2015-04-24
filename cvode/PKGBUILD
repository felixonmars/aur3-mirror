# BUILD INSTRUCTIONS:
# ----------------------
# Need a fast and email free registration to download.
# Visit http://computation.llnl.gov/casc/sundials/download/download.html
# and download cvode-2.8.1.tar.gz and place it in the same directory as this file.

pkgname=cvode
pkgver=2.8.1
pkgrel=1
pkgdesc="A solver for stiff and nonstiff ordinary differential equation (ODE) systems "
arch=('any')
url="http://computation.llnl.gov/casc/sundials/main.html"
depends=()
makedepends=('cmake')
optdepends=()
license=('custom')
source=('cvode-2.8.1.tar.gz')
sha1sums=('4f1df7776adb4cc223a5c30c19ac749afa2b3a0a')

build() {
  cd "${pkgname}-${pkgver}"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release 
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="${pkgdir}" install
  cd ..
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
