# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>
pkgname=python-pycallgraph
url="https://pypi.python.org/pypi/pycallgraph"
pkgver=1.0.1
pkgrel=1
pkgdesc="Python Call Graph is a library and command line tool that visualises the flow of your Python application"
arch=('any')
license=('GPLv2')
depends=(python python-distribute graphviz)
source=(https://github.com/gak/pycallgraph/archive/$pkgver.tar.gz)
md5sums=('b74aa0bb84f53e5d241f5dc16a83f143')

package()
{
  cd "$srcdir/pycallgraph-$pkgver/"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
}
