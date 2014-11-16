
# Maintainer: yafengabc <yafengabc@gmail.com>

pkgname=ssdw
pkgver=1.0
pkgrel=1
pkgdesc="An Script to count how much write of your SSD"
arch=('any')
url="https://github.com/yafengabc/ssdw"
license=('GPLv3')
depends=('smartmontools')
makedepends=()
conflicts=("$pkgname")
provides=("$pkgname")
source=("git://github.com/yafengabc/ssdw.git")
#install=$pkgname.install


package() {
	install -g root -o root -D $srcdir/ssdw/ssdw  $pkgdir/usr/bin/ssdw
}
md5sums=('SKIP')
