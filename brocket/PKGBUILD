# Maintainer: David Mikalova <dmikalova at gmail dot com>
pkgname=brocket
pkgver=2.1
pkgrel=2
pkgdesc='A launcher for X11 WMs that attempts to prevent multiple instances.'
arch=(any)
url=https://github.com/dmikalova/brocket
license=('GPL')
groups=()
depends=('bash' 'wmctrl' 'bc')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(brocket)
md5sums=('a4d4687c11cef5eba44d427f89990c74')

package() {
  install -Dm 755 $srcdir/brocket ${pkgdir}/usr/bin/brocket
}
