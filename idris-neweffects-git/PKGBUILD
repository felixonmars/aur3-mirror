# Maintainer: Leif Warner <abimelech@gmail.com>
_authorName=edwinb
_gitname=Eff-new
pkgname=idris-neweffects-git
pkgver=5.e906e2d
pkgrel=1
pkgdesc="Parser combinators for Idris"
url="https://github.com/$_authorName/$_gitname"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('idris')
source=("git://github.com/$_authorName/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}
build() {
  cd $_gitname
  idris --build neweffects.ipkg
}
package() {
  cd $_gitname
  TARGET=$pkgdir`idris --libdir` idris --install neweffects.ipkg
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/idris-neweffects/LICENSE
}
