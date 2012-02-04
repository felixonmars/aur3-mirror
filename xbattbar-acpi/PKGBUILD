# Maintainer: Mathias R. Larsen <tripox@tripox.dk>

pkgname=xbattbar-acpi
pkgver=0.4.0
pkgrel=2
pkgdesc="A simple battery indicator bar"
arch=('any')
url="http://mirrors.kernel.org/ubuntu/pool/universe/x/xbattbar-acpi/"
license=('GPL2')
groups=()
depends=('libacpi' 'xosd')
makedepends=()
optdepends=()
conflicts=()
replaces=()
source=("http://mirrors.kernel.org/ubuntu/pool/universe/x/xbattbar-acpi/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('683de32cafd7d08199d832945862ea6f')

build() {
  cd "$srcdir/xbattbar"
  make
}

package() {
  cd "$srcdir/xbattbar"
  install -Dm755 xbattbar-acpi ${pkgdir}/usr/bin/xbattbar-acpi
  install -Dm644 xbattbar-acpi.1 ${pkgdir}/usr/share/man/man1/xbattbar-acpi.1.gz
}
