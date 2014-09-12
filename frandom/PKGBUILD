# Contributor: Patrick Buddeberg <perchy22  at gmail dot com>
# Modified from: Jeffrey Grembecki jeff _a*t mcmedia _d.ot c~om d-ot _au

pkgname=frandom
pkgver=1.1
pkgrel=9
pkgdesc="A very fast random number generator kernel module"
arch=('i686' 'x86_64')
url="http://frandom.sourceforge.net/"
license=('GPL')
makedepends=('linux-headers')
depends=('linux')
install=$pkgname.install
source=(http://sourceforge.net/projects/frandom/files/$pkgname-$pkgver.tar.gz
        frandom.udev.patch)
md5sums=('aade48078496da7439eda41937a34e61'
         'f9a36f3a3c7f9caaae6475f6edea079c')
sha256sums=('9ad27d13cb5087e4c061b03da46963d9581b26ed625e1dfe79982b07c9f42f97'
            '94b42818ac92da76ec4748260ce30df785e59610b0c161bb4683c367b96b3f19')

_extramodules=$(readlink -f "/usr/lib/modules/$(uname -r)/extramodules" || true)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 < "$srcdir/frandom.udev.patch"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  gzip -f -9 "$pkgname.ko"
  install -Dm644 "$pkgname.ko.gz" "$pkgdir/$_extramodules/$pkgname.ko.gz"
  install -Dm644 10-$pkgname.rules "$pkgdir/usr/lib/udev/rules.d/10-$pkgname.rules"

  # update kernel version in install file
  sed -ri "s#^(extramodules=).*\$#\1$_extramodules#" "$startdir/$pkgname.install"
}
