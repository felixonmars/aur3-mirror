# Maintainer: Florian Walch <florian+aur@fwalch.com>

pkgname=unilibium-git
pkgrel=1
pkgver=0.r58.68f67b4
pkgdesc="A terminfo parsing library."
arch=('i686' 'x86_64')
url="https://github.com/mauke/unibilium"
license=('LGPL3')
makedepends=('git')
conflicts=('unilibium')
provides=('unilibium')
source=("${pkgname}::git://github.com/mauke/unibilium.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}"
  make PREFIX=/usr DESTDIR=${pkgdir} install
}

# vim:set sw=2 sts=2 et:
