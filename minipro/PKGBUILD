# Maintainer:
pkgname=minipro
pkgver=20140301
pkgrel=1
pkgdesc="An opensource rewrittement of autoelectric.cn programming utility"
url="https://github.com/vdudouyt/minipro"
arch=('x86_64' 'i686')
license=('GPL')
#depends=()
#optdepends=()
makedepends=('git')
#conflicts=()
#replaces=()
#backup=()
#install=
source="git://github.com/vdudouyt/minipro.git"
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  make && make DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et: