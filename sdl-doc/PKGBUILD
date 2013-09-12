# Maintainer: Axper Jan <483ken 4t gmail d0t com>
pkgname=sdl-doc
pkgver=1.2.15
pkgrel=1
pkgdesc="Set of HTML documentation for SDL 1.2"
arch=('any')
url="http://www.libsdl.org/download-1.2.php"
license=('LGPL2.1')
groups=('devel')
source=("http://www.libsdl.org/release/SDL-${pkgver}.tar.gz")
sha512sums=('ac392d916e6953b0925a7cbb0f232affea33339ef69b47a0a7898492afb9784b93138986df53d6da6d3e2ad79af1e9482df565ecca30f89428be0ae6851b1adc')

package() {
  mkdir -p "${pkgdir}/usr/share/doc/sdl-1.2"
  cp "${srcdir}/SDL-${pkgver}/docs/index.html" "${pkgdir}/usr/share/doc/sdl-1.2"
  cp -r "${srcdir}/SDL-${pkgver}/docs/html" "${pkgdir}/usr/share/doc/sdl-1.2"
}
