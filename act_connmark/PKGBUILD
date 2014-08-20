 # Contributor: gamanakis

pkgname=act_connmark
pkgver=3.16
pkgrel=4
pkgdesc="A TC action to retrieve the MARK of a packet through CTMARK in INGRESS. Source modified from OpenWRT.org"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('linux-headers')
depends=('linux')
install=act_connmark.install
source=('act_connmark.c'
	'Makefile')
md5sums=('ab9176df8cc67c0c8dd30d8319f142ce'
         '06b4c0e2785884eff1c9e991740f9718')
url="https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.14/621-sched_act_connmark.path"

_kernmajor="$(pacman -Q linux | awk '{print $2}' | cut -d - -f1 | cut -d . -f1,2)"
_extramodules="extramodules-${_kernmajor}-ARCH"
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

build() {
  cd "${srcdir}"
  make -C /usr/lib/modules/${_kernver}/build M=`pwd`
}

package() {
 install -Dm755 act_connmark.ko $pkgdir/usr/lib/modules/${_extramodules}/act_connmark.ko
}

