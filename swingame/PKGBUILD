# Author: Andrew Cook <ariscop@gmail.com>

pkgname=swingame
pkgver=3.0
pkgrel=2
pkgdesc="SwinGame api"
arch=('i686' 'x86_64')
url="http://swingame.com"
license=('GPL')
makedepends=('fpc')
depends=(sdl_net sdl_ttf sdl_mixer sdl_image sdl_gfx sdl)
source=("http://swingame.com/images/downloads/SwinGame3.0/Source_of_SwinGame_3_0.zip")
md5sums=('9665a42aa818e2adea0659a8b7611409')

build() {
  cd "${srcdir}/ProjectTemplate"
  ./build.sh
}

package() {
  cd "${srcdir}/ProjectTemplate"
  install -Dm755 "bin/linux/libSGSDK.so.${pkgver}" "${pkgdir}/usr/lib/libSGSDK.so.${pkgver}"
  ln -s "libSGSDK.so.${pkgver}" "${pkgdir}/usr/lib/libSGSDK.so"
  ln -s "libSGSDK.so.${pkgver}" "${pkgdir}/usr/lib/libsgsdk.so"
  install -Dm644 "src/SGSDK.h" "${pkgdir}/usr/include/sgsdk/SGSDK.h"
  install -Dm644 "src/Types.h" "${pkgdir}/usr/include/sgsdk/Types.h"
}
