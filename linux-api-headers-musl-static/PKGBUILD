# Maintainer: Denis Kulakov <ked9@yandex.ru>

pkgname=linux-api-headers-musl-static
pkgver=3.12.1
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace, installed in musl dir"
arch=('i686' 'x86_64')
url="https://www.kernel.org/"
license=('GPL')
makedepends=('make')
conflicts=()
options=(strip !libtool staticlibs !upx !debug)
source=(https://www.kernel.org/pub/linux/kernel/v3.x/linux-$pkgver.tar.xz)
md5sums=('f6f34baf553f278ff4637d8eaeff5dcd')

build() {
  cd "$srcdir/linux-$pkgver"

  make headers_check
}

package() {
  cd "$srcdir/linux-$pkgver"

  make INSTALL_HDR_PATH=$pkgdir/usr/musl/  headers_install
  find $pkgdir -name .install -delete -or -name ..install.cmd -delete
}
