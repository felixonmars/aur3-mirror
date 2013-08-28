pkgname=pwvault-git
_gitname=pwvault
pkgver=0.9.47.g1872bb7
pkgrel=1
pkgdesc="commandline get keepassx password"
arch=('any')
url="http://github.com/cdede/pwvault/"
license=('GPL3')
depends=('python-kppy' )
makedepends=('git' )

source=('git+https://github.com/cdede/pwvault.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}
build() {
  cd $_gitname
  python setup.py build
}
package() {
  cd $_gitname
  python setup.py install --root="$pkgdir/" --optimize=1
}
