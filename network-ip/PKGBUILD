# Maintainer: allspark <allspark at planetcyborg dot de>

pkgname=network-ip
pkgver=0.2
pkgrel=3
pkgdesc="a replacement for the standard init network script. it uses ip instead of ifconfig/route"
arch=('any')
url="http://blog.hq.h-ix.net/"
license=('GPL')
groups=()
depends=("iproute2")
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
source=("network-ip")
noextract=()
md5sums=('dc0cc6876030c7a23ca3559423d1b014')

build() {
	mkdir -p "$pkgdir"/etc/rc.d/
	install network-ip "$pkgdir"/etc/rc.d
}
