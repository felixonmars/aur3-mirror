# Contributor: Corrado Primier <bardo@aur.archlinux.org>

pkgname=p2k-core
pkgver=1.1
pkgrel=2
pkgdesc="Command-line utility to administrate P2K-based motorola phones"
arch=('i686' 'x86_64')
url="http://www.el-co.hu/smf/index.php/board,33.0.html"
license=('GPL')
depends=('libusb-compat')
source=("http://www.el-co.hu/dl/$pkgname-V_$pkgver.zip")
md5sums=('5dc812647a1efce546505ff09e27a361')

build() {
 cd "$srcdir"
 sed -i 's%\(if(!dev->config) i=usb_fetch_and_parse_descriptors(curr_dev); else i = 1;\)%//\1%' p2k-core.c
 make
}

package() {
 install -Dm 755 "$srcdir/p2k-core" "$pkgdir/usr/bin/p2k-core"
}
