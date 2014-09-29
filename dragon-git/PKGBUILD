# Maintainer: Ryan Jacobs <ryan.mjacobs@gmail.com>
_pkgname=dragon
pkgname=$_pkgname-git
pkgver=9.a49d775
pkgrel=1
pkgdesc="simple drag-and-drop source/sink for X"
arch=('i686' 'x86_64')
url="https://github.com/mwh/dragon"
license=('GPLv3')
depends=('gtk3')
makedepends=('git')
options=()
source=("git+git://github.com/mwh/dragon")

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm 0755 dragon "$pkgdir/usr/bin/dragon"
}

# Skip checksums for Git
md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')
sha384sums=('SKIP')
sha512sums=('SKIP')
