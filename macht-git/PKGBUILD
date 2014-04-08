# Maintainer: Rolf Morel <$myfullname_without_spaces@gmail.com>
_pkgname="macht"
pkgname="${_pkgname}-git"
pkgver=69.484afad
pkgrel=1
pkgdesc="A 2048 clone in python with Terminal UI"
arch=('i686' 'x86_64')
url="https://github.com/polyphemus/${_pkgname}"
license=('GPL3')
depends=('python' 'python-blessed')
makedepends=('git')
provides=("macht")
conflicts=("macht")
source=('git://github.com/polyphemus/macht.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
