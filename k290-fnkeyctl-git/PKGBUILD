# Maintainer: wfdctrl <wfdctrl at gmail dot com>

pkgname=k290-fnkeyctl-git
pkgver=v1.1.r9.g5804c9f
pkgrel=1
pkgdesc="Reconfigures the way the function keys on Logitech K290 keyboards work"
arch=('i686' 'x86_64')
url="https://github.com/milgner/k290-fnkeyctl"
license=('MIT')
depends=('libusb>=1.0')
makedepends=('git')
source=("$pkgname::git+https://github.com/milgner/k290-fnkeyctl.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./build.sh
  sed -i 's:/usr/local/sbin:/usr/bin:g' 99-k290-config.rules
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m644 LICENSE.MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 k290_fnkeyctl "${pkgdir}/usr/bin/k290_fnkeyctl"
  install -D -m644 99-k290-config.rules "${pkgdir}/etc/udev/rules.d/99-k290-config.rules"
}
