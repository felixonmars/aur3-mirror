# Maintainer: mrgreen <mrgreen@archbang.org>
# quick and dirty pkgbuild to build void-runit scripts as an
# Archlinux package
# 
# Not fully completed so use with caution

# copyright see
# http://creativecommons.org/publicdomain/zero/1.0/

pkgname=void-runit
pkgver=245.2ba8f93
pkgrel=1
pkgdesc='Void linux runit init scripts'
url="http://voidlinux.eu"
license=('Creative Commons')
arch=('any')
source=("$pkgname::git+https://github.com/voidlinux/void-runit")
sha256sums=('SKIP')
# most of depends are not needed, they're present only for clarity
depends=('runit-musl')
makedepends=('git')
optdepends=('sudo: install and update packages as non-root'
            'customizepkg: apply customizepkg modifications')
provides=('void-runit')
conflicts=()

build() {
  true
}

pkgver() {
  cd "$pkgname"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
	make
	make DESTDIR="$pkgdir/" install
}
