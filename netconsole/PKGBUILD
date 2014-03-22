# Maintainer: Alexander Sulfrian <alexander@sulfrian.net>

pkgname='netconsole'
pkgver=2014.01
pkgrel=1
pkgdesc='Netconsole script for u-boot'
arch=('i686' 'x86_64' 'arm')
url='http://www.denx.de/wiki/U-Boot/WebHome'
license=('GPL2')
depends=('netcat')

source=("ftp://ftp.denx.de/pub/u-boot/u-boot-${pkgver}.tar.bz2")
md5sums=('e531307578f6d32a7ccb1d04f1e08cbc')

build() {
    cd "$srcdir/u-boot-$pkgver"
    make tools/ncb
}

package() {
    cd "$srcdir/u-boot-$pkgver"
    install -d "$pkgdir/usr/bin/"
    install tools/ncb tools/netconsole "$pkgdir/usr/bin/"
}
