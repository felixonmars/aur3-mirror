# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Arnaud Durand-Favreau <biginoz at free point fr>

pkgname=roadfighter
pkgver=1.0.1269
pkgrel=3
pkgdesc="Simple racing game (remake of the Konami's MSX1 classic game)"
arch=('i686' 'x86_64')
url="http://www2.braingames.getput.com/roadf"
license=('custom: freeware')
depends=('sdl_image' 'sdl_mixer' 'sdl_sound' 'sdl_ttf' 'gcc-libs')
source=("http://braingames.jorito.net/${pkgname}/downloads/${pkgname}.src_${pkgver}.tgz"
        "${pkgname}.sh")
md5sums=('a1626dda4d17ae30bbdd9c1ede2cd555'
         '0d87f805a1c320e1ca58d07305d11c8f')

build(){
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make PREFIX="${pkgdir}/usr/" \
    GAMEDIR="${pkgdir}/usr/bin/" \
    BINDIR="${pkgdir}/usr/share/${pkgname}" install
  install -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/readme.txt" "${pkgdir}/usr/share/doc/${pkgname}/readme.txt"
}

# vim:set ts=2 sw=2 et:
