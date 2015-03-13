 # Contributor: gamanakis

pkgname=act_connmark-lts
pkgver=3.14
pkgrel=3
pkgdesc="A TC action to retrieve the MARK of a packet through CTMARK in INGRESS. Source modified from OpenWRT.org"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('linux-lts-headers')
provides=('act_connmark')
depends=('linux-lts')
install=act_connmark.install
source=('act_connmark.c'
	'Makefile')
md5sums=('93667f17bebefca21381ab4ecf2c885f'
         '529b8e69a3ba82d3d6f70ecd2d1d4067')
url="https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.14/621-sched_act_connmark.patch"

_kernmajor="$(pacman -Q linux-lts | awk '{print $2}' | cut -d - -f1 | cut -d . -f1,2)"
_extramodules="extramodules-${_kernmajor}-lts"
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

build() {
	cd "${srcdir}"
	make -C /usr/lib/modules/${_kernver}/build M=`pwd`
}

package() {
 install -Dm755 act_connmark.ko $pkgdir/usr/lib/modules/${_extramodules}/act_connmark.ko
}

