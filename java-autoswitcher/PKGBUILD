# Maintainer: Stephen Bell <theredbaron1834@yahoo.com>

pkgname=java-autoswitcher
pkgver=r11.0ea3d0d
pkgrel=1
pkgdesc="Auto switch between versions of Java"
arch=('any')
url="https://github.com/theredbaron1834/Scripts"
license=('GPL')
depends=('java-common')
makedepends=('git')
source=("$pkgname"::'git://github.com/theredbaron1834/Scripts.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$srcdir/$pkgname/java-autoswitcher" "$pkgdir/usr/bin/java-autoswitcher"
}
