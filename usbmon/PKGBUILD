# Maintainer: Maurício CA <mauricio.antunes@gmail.com>
pkgname=usbmon
pkgver=6
pkgrel=1
epoch=
pkgdesc="Sample userland for Linux usbmon binary API"
arch=(i686 x86_64)
url="http://people.redhat.com/zaitcev/linux"
license=('GPL')
groups=()
depends=()
makedepends=(make gzip coreutils)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('3be79e0bf0cc7f537ec34a98a4a597a0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
  gzip "$pkgname.8"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 644 "./$pkgname.8.gz" "$pkgdir/usr/share/man/man8/$pkgname.8.gz"
  install -D "./$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
