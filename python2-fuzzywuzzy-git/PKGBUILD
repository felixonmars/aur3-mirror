#Maintainer: Dominik Kozaczko <aur@kozaczko.info>

# epoch=1 because previous version used dates

pkgname=python2-fuzzywuzzy-git
epoch=1
pkgver=f773b29
pkgrel=1
pkgdesc="Fuzzy string matching like a boss."
arch=(any)
url="https://github.com/seatgeek/fuzzywuzzy"
license=('BSD')
depends=('python2')
makedepends=('git')
provides=('python2-fuzzywuzzy')
conflicts=('python2-fuzzywuzzy')
source=("git://github.com/seatgeek/fuzzywuzzy.git")
md5sums=('SKIP')

_gitname="fuzzywuzzy"

pkgver() {
    cd "$_gitname"
    git describe --always | sed 's/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"

  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/COPYING"
}
