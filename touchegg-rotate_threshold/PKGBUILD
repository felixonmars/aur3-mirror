# Maintainer: Jan Frederick Eick <j.f.eick@gmx.de>

pkgname=touchegg-rotate_threshold
pkgver=1.1
pkgrel=0
pkgdesc="Multitouch gesture recognizer - patched to include a threshold for ROTATE gesture"
arch=('i686' 'x86_64')
url="https://code.google.com/p/touchegg/"
license=('GPL')
replaces=('touchegg')
provides=('touchegg')
conflicts=('touchegg')
depends=('qt' 'geis')
source=("http://touchegg.googlecode.com/files/touchegg-${pkgver}.tar.gz" 
        "rotate_threshold.patch" )
sha512sums=('27b0a4ee3247f0c6fdd9a80fa6bedfc373a2d5f486615157d711aa501dced9745850e2a5053e5680ad7bf094246824a51b616a7a46032dbd6243694392e13040'
            '1229d2c6266c5a8d0420a6f75ebef6cff351cdc8538dcffa6d16e1c246e4178e0e0a560ad42dbc31837301d76f9a148b83266dc9114701f0b7f24caefc02722a')

build() {
  cd "${srcdir}/touchegg-${pkgver}"
  patch -Np1 -i ../rotate_threshold.patch
  sed -i 's/utouch-geis/geis/g' touchegg.pro
  # Cannot build with default compiler/linker flags
  unset CXXFLAGS CFLAGS LDFLAGS
  qmake
  make -j1
}

package() {
  cd "${srcdir}/touchegg-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
