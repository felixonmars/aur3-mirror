# Maintainer: Tim van Dalen <Tim@timvdalen.nl>
pkgname=hiberbat
pkgver=1.0.1
pkgrel=2
pkgdesc="Hiberbat is a small daemon that checks if your main battery is on a critical level and if so, hibernates. The beauty is that it's highly configurable."
arch=(any)
url="http://timvdalen.nl/projects/hiberbat"
license=('GPL')
groups=()
depends=("hibernate-script" "acpi")
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('7951e2ea1498dc00df2ca8a9d77565d4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

}
