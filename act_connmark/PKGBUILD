 # Contributor: gamanakis

pkgname=act_connmark
pkgver=3.19
pkgrel=1
pkgdesc="A TC action to retrieve the MARK of a packet through CTMARK in INGRESS. Source modified from OpenWRT.org"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('linux-headers')
depends=('linux')
install=act_connmark.install
source=('act_connmark.c'
	'Makefile')
md5sums=('a32f88a603a8b7e82248157145536568'
         '06b4c0e2785884eff1c9e991740f9718')
url="https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.19/621-sched_act_connmark.patch"

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
