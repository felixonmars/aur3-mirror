# Maintainer: Bob Fanger < bfanger(at)gmail >
# Contributors: Filip <fila pruda com>, Det < nimetonmaili(at)gmail >
# Credits: nvidia-all
pkgname=r8168
pkgver=8.026.00
pkgrel=2
_kernver=`uname -r`
pkgdesc="A kernel module for Realtek 8168 network cards"
url="http://www.realtek.com.tw"
license="realtek"
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('linux-headers')
source=(http://r8168.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
install=$pkgname.install
sha1sums=('22128efb9e8a0b2a90e6c3b9ed912756d591da9e')

# Use pacman version numbers. Should only be used with kernels with long version numbers (e.g. -git ones)
USE_PACMAN_VERSION="0" # "1" to enable

if [ "$USE_PACMAN_VERSION" = "1" ]; then
  _PACKAGES=`pacman -Qsq linux`
  _KERNELS=`pacman -Ql $PACKAGES | grep /modules.alias.bin | sed 's/.*\/lib\/modules\/\(.*\)\/modules.alias.bin/\1/g'`
else
  _KERNELS=`file /boot/* | grep 'Linux kernel.*boot executable' | sed 's/.*version \([^ ]\+\).*/\1/'`
fi

build() {
  # Loop through all detected kernels
  for _kernver in $_KERNELS; do
    cd "${srcdir}"
    cp -R ${pkgname}-${pkgver} ${pkgname}-${pkgver}-${_kernver}
    cd ${pkgname}-${pkgver}-${_kernver}
    sed -i -e "s|\$(shell uname -r)|${_kernver}|" src/Makefile #Fix rebuild during major kernel upgrades
    msg2 "Building module for ${_kernver}"
    make clean SYSSRC=/usr/src/linux-${_kernver} modules
  done

  # Modify .install
  if [ "$USE_PACMAN_VERSION" = "1" ]; then
    sed 's/USE_PACMAN_VERSION=0/USE_PACMAN_VERSION=1/g' "${startdir}/${pkgname}.install" >/dev/null 2>&1
  else
    sed 's/USE_PACMAN_VERSION=1/USE_PACMAN_VERSION=0/g' "${startdir}/${pkgname}.install" >/dev/null 2>&1
  fi
}

package() {
  install -d -m755 "${pkgdir}/etc/modprobe.d"
  # Loop through all detected kernels
  for _kernver in $_KERNELS; do
    cd "${srcdir}/${pkgname}-${pkgver}-${_kernver}/src"
    # Install kernel module
    install -D -m644 ${pkgname}.ko "${pkgdir}/lib/modules/${_kernver}/kernel/drivers/net/${pkgname}.ko"
    gzip "${pkgdir}/lib/modules/${_kernver}/kernel/drivers/net/${pkgname}.ko"
  done
}
