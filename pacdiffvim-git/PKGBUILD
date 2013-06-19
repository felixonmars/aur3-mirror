# Contributor: jens-na <jens at 0x6a dot de>

pkgname=pacdiffvim-git
_gitname=pacdiffvim
pkgver=fb5c9f9
pkgrel=1
pkgdesc="a pacnew/pacorig/pacsave file updater for vim enthusiasts"
arch=('any')
url="https://github.com/jens-na/pacdiffvim"
license=('GPL3')
depends=('bash' 'vim')
makedepends=('git')
source=('git://github.com/jens-na/pacdiffvim.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $_gitname
  install -Dm755 "$srcdir/pacdiffvim/pacdiffvim" "$pkgdir/usr/bin/pacdiffvim"
}
