# Maintainer: Fabian Köhler <fabian2804 (AT) googlemail (DOT) com>
pkgname=boost-compute-git
pkgver=0.4
pkgrel=2
pkgdesc="A C++ GPU Computing Library for OpenCL"
arch=('i686' 'x86_64')
url="https://github.com/kylelutz/compute"
license=('custom')
depends=('boost')
makedepends=('git')
optdepends=('eigen: interop'
            'qt4: interop with qt4'
            'qt5: interop with qt5'
            'opencv: OpenCV interop'
            'vtk: VTK interop')
conflicts=('boost-compute')
provides=('boost-compute')
source=('git://github.com/kylelutz/compute.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/compute"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
  cd "${srcdir}/compute/build"
  make DESTDIR="${pkgdir}/" install
  cd ..
  install -D -m644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
