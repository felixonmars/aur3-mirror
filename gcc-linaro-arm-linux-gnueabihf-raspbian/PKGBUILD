# Maintainer: mickael9 <mickael9 at gmail dot com>
pkgname=gcc-linaro-arm-linux-gnueabihf-raspbian
pkgver=49.318aa31
pkgrel=1
pkgdesc="Linaro cross compiler toolchain for Raspberry Pi"
arch=('i686' 'x86_64')
url="https://github.com/raspberrypi/tools/tree/master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64"
license=('GPL')
makedepends=('git')
provides=('arm-bcm2708-linux-gnueabi')
source=('git://github.com/raspberrypi/tools.git')
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd tools
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  [[ "$CARCH" == "x86_64" ]] && suffix=-x64

  cd "${srcdir}/tools/arm-bcm2708/"
  install -d "${pkgdir}"/{opt,usr/bin/${pkgname}}
  cp -a "${pkgname}${suffix}" "${pkgdir}/opt/${pkgname}"
  for f in "${pkgdir}"/opt/${pkgname}/bin/arm-linux-gnueabihf-*
  do
    ln -s /opt/${pkgname}/bin/${f##*/} "${pkgdir}/usr/bin/${pkgname}/${f##*/arm-linux-gnueabihf-}"
  done
}
