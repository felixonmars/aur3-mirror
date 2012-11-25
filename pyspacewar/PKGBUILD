#  Maintainer: Alexej Magura <agm2819 at gmail> 
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Stefano Esposito <ragnarok@email.it>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=pyspacewar
pkgver=0.9.7
pkgrel=3
pkgdesc="Open source game loosely based on the original Spacewar"
arch=('any')
url="http://mg.pov.lt/pyspacewar/"
license=('GPL' 'CCPL' 'custom')
depends=('python2-pygame')
source=("http://mg.pov.lt/pyspacewar/${pkgname}-${pkgver}.tar.gz"
        "setup.patch"
        "${pkgname}.desktop")
md5sums=('164128ba8a84415748ce4fbc3c2c5647'
         '618630e55daea125c719c32570c63bee'
         'c91e3abb0183fc90b84dcee00c714e5f')

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install game files
  patch -p1 -i ../setup.patch
  python2 setup.py install --root="${pkgdir}"

  # Install the pixmap and .desktop file
  install -Dm644 src/pyspacewar/icons/pyspacewar48.svg "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install docs
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 *.txt "${pkgdir}/usr/share/doc/${pkgname}"

  # Install licenses
  cd src/pyspacewar
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 icons/README.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_ICONS"
  install -m644 images/README.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_IMAGES"
  install -m644 sounds/README.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_SOUNDS"
}
