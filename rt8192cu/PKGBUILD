# Maintainer: David Herrmann <dh.herrmann@googlemail.com>
pkgname=rt8192cu
pkgver=3.4.3.4369.20120622
pkgrel=1
pkgdesc="Driver for Realtek RTL8188CUS (8188C, 8192C) chipset wireless cards"
arch=('i686' 'x86_64')
url="http://github.com/dvdhrm/$pkgname"
license=('GPL')
# remove this dependency if you use self-built kernels
depends=('linux')
makedepends=('linux-headers')
source=(https://github.com/downloads/dvdhrm/$pkgname/$pkgname-$pkgver.tar.gz)
#source=($pkgname-$pkgver.tar.gz)
md5sums=('7aed2ccee156bafcef5a0126044f47ee')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/lib/modules/`uname -r`/kernel/drivers/net/wireless/"
  install -p -m 644 8192cu.ko  "$pkgdir/lib/modules/`uname -r`/kernel/drivers/net/wireless/"
}
