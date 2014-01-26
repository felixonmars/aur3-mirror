pkgname=ketpegs-git
_gitname=ketpegs
_pkgver="0.9.10"
pkgver=0.9.10
pkgrel=1
pkgdesc="A thicket and pegs game using the curses"
arch=('any')
url="http://github.com/cdede/ketpegs/"
license=('GPL3')
depends=('python-urwid')
makedepends=('git' )

source=("${_gitname}::git+https://github.com/cdede/ketpegs.git#tag=${_pkgver}")
sha256sums=('SKIP')

build() {
  cd $_gitname
  python setup.py build
}

package() {
  cd $_gitname
  python setup.py install --root="$pkgdir/" --optimize=1
}
