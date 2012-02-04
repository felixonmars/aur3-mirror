# $Id: PKGBUILD,v 1.1 2007/02/12 08:42:07 aaron Exp $
# Maintainer: damir <damir@archlinux.org>
# Maintainer : Aaron Griffin <aaron@archlinux.org>

pkgname=km
pkgver=0.6.1
pkgrel=1
_kernver=2.6.20-ARCH
pkgdesc="Video4linux interface to video capture capabilities of Mach64, Rage128 and Radeon cards for the Kernel 2.6"
arch=('i686' 'x86_64')
license=('GPL')
url="http://gatos.sourceforge.net/km.php"
replaces=('kernel26-km')
install=module.install
source=(http://easynews.dl.sourceforge.net/sourceforge/gatos/$pkgname-$pkgver.tgz
        build-2.6.20.patch)
md5sums=('0bec695aaa0b4d9793a5c65e91842771' '7a3ab57fa4ffbc34261d56042bb32ef2')

build() {
  cd $startdir/src/km

  cp Makefile-2.6 Makefile
  patch -up1 < ../build-2.6.20.patch

  make KDIR=/lib/modules/$_kernver/build || return 1
  make INSTALL_MOD_PATH=$startdir/pkg KDIR=/lib/modules/$_kernver/build \
      install || return 1

  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}
