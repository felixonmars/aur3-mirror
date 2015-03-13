# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: demonicmanic <namida1@gmx.net>

_pkgname=acidx
pkgname=acidx-git
pkgver=r17.f549dd3
pkgrel=1
pkgdesc="your Xdefaults on acid"
arch=('x86_64' 'i686')
url="https://github.com/kristopolous/acidx.git"
license=('GPL2')
depends=(glibc)
source=("git://github.com/kristopolous/acidx.git")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname

  make
}

package() {
  cd $_pkgname

  install -Dm755 acidx "$pkgdir/usr/bin/acidx"
  install -Dm755 acidx "$pkgdir/usr/bin/acidxbright"
}

# vim:set ts=2 sw=2 et:
