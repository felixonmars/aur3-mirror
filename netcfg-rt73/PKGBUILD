pkgname="netcfg-rt73"
pkgver="0.1"
pkgrel=1
pkgdesc="Ralink wireless support for netcfg2 with WPA support"
url="http://aur.archlinux.org"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('netcfg')
makedepends=()
install="$pkgname.install"
source=("wirelessral.subr" "$pkgname.install")
md5sums=('5f15257dfdb4f9a2e4df53c01ed3f08e'
         'c153c0c478330a94b83794cd170acb52')

build() {
	install -D -m644 "$srcdir/wirelessral.subr" "$pkgdir/usr/lib/network/wirelessral.subr"
}
