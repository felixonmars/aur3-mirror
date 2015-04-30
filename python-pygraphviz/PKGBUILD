pkgname=python-pygraphviz
_pkgname=pygraphviz
pkgver=1.3rc2
pkgrel=1
pkgdesc='PyGraphviz is a Python interface to the Graphviz graph layout and visualization package. (python3 version)'
arch=('i686' 'x86_64')
license=('LGPL')
url="https://networkx.lanl.gov/pygraphviz"
depends=('python' 'graphviz')

source=(http://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-$pkgver.tar.gz)
md5sums=('061ff5c4b8ea4b7cd05be0588172ef07')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
