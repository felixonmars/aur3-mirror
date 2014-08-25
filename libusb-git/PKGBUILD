# Original Derivative Creator: Stefano Facchini <stefano.facchini@gmail.com>
# Current Maintainer: Zachary Lund <admin@computerquip.com>

pkgname=libusb-git
pkgver=v1.0.19.r0.ge11525c
depends=('glibc' 'systemd')
pkgrel=1
pkgdesc="Library to enable user space application programs to communicate with USB devices."
arch=(i686 x86_64)
url="http://libusb.info/"
license=('LGPL')
options=(!libtool)
conflicts=('libusb1' 'libusbx' 'libusb')
source=(libusb::git+https://github.com/libusb/libusb)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/libusb"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/libusb"
  ./bootstrap.sh
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd "${srcdir}/libusb"
  make check
}

package () {
  cd "${srcdir}/libusb"
  make DESTDIR="${pkgdir}" install
}