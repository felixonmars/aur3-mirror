# Contributor: Tocer Deng <tocer.deng@gmail.com>
pkgname=python2-pycallgraph
pkgver=1.0.1
pkgrel=1
pkgdesc="A Python module that creates call graphs for Python programs"
arch=('i686' 'x86_64')
url="http://pycallgraph.slowchop.com/"
license=('GPL2')
depends=('python' 'graphviz')
source=(http://packages.crate-cdn.com/b/1/2/6/b1262b0f9831da889c6e9a9a82a22267df497013cd2f5b36c39359a607c91e71/pycallgraph-$pkgver.tar.gz)
sha256sums=('b1262b0f9831da889c6e9a9a82a22267df497013cd2f5b36c39359a607c91e71')

package() { 
    cd $srcdir/pycallgraph-$pkgver
    python2 setup.py install --root=$pkgdir || return 1
    install -D -m644 man/pycallgraph.1 $pkgdir/usr/share/man/man1/pycallgraph.1
}
