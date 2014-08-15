 # Contributor: gamanakis

pkgname=act_connmark-lts
pkgver=3.14
pkgrel=2
pkgdesc="A TC action to retrieve the MARK of a packet through CTMARK in INGRESS. Source modified from OpenWRT.org"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('linux-lts-headers')
provides=('act_connmark')
depends=('linux-lts')
install=act_connmark.install
source=('act_connmark.c'
	'Makefile')
md5sums=('145baf544b087aadf92b6ca131216c75'
         '0e432ed9c1fafc76aae8b10e440f6a9c')
url="https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.14/621-sched_act_connmark.path"

build() {
  make
}

package() {
 install -Dm755 act_connmark.ko $pkgdir/usr/lib/modules/`uname -r`/extramodules/act_connmark.ko
}

