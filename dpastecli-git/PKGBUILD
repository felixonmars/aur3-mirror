# Contributor: jens-na <jens at 0x6a dot de>

pkgname=dpastecli-git
_gitname=dpastecli
pkgver=4280f0b
pkgrel=1
pkgdesc="pastes content from stdin to dpaste.com"
arch=('any')
url="https://github.com/jens-na/dpastecli"
license=('GPL3')
depends=('bash')
makedepends=('git')
source=('git://github.com/jens-na/dpastecli.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $_gitname
  install -Dm755 "$srcdir/dpastecli/dpastecli" "$pkgdir/usr/bin/dpastecli"
}
