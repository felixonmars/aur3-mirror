# Maintainer: Army

_gitname=sic
pkgname="${_gitname}-git"
pkgver=119.7cfa52d
pkgrel=1
pkgdesc="An extremely simple IRC client"
arch=('i686' 'x86_64')
url='http://tools.suckless.org/sic'
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("${_gitname}::git+http://git.suckless.org/sic")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_gitname}"
  echo "$(git rev-list --count HEAD).$(git describe --always )"
}

build() {
  cd "$srcdir/${_gitname}"
  make
}

package() {
  cd "$srcdir/${_gitname}"
  make PREFIX='/usr' DESTDIR="${pkgdir}" install
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
