# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: rabyte <rabyte__gmail>

pkgname=o2em
pkgver=1.18
pkgrel=3
pkgdesc="An emulator of the Magnavox Odyssey 2 video game console"
arch=('i686' 'x86_64')
url="http://o2em.sourceforge.net/"
license=('custom:Clarified Artistic')
depends=('allegro4')
makedepends=('unzip')
source=("http://downloads.sourceforge.net/${pkgname}/o2em118src.zip"
        "${pkgname}.patch")
noextract=("o2em118src.zip")
md5sums=('be96af886370df337fe8584827717627'
         'cc8bfb496dbcbd97fdfdf02df31259ce')

build() {
  cd "${srcdir}"

  # Unzip the archive
  unzip -La o2em118src.zip
  patch -Np0 -i "../${pkgname}.patch"

  # Compile
  cd "o2em118src/src"
  make -f makefile.linux || return 1
}

package() {
  cd "${srcdir}/o2em118src/src"

  # Install binaries
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 o2em dis48 "${pkgdir}/usr/bin"

  # Install docs
  install -Dm644 ../docs/o2em.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 ../docs/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install pixmap
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
