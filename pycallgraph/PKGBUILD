# Contributor: Tocer Deng <tocer.deng@gmail.com>
pkgname=pycallgraph
pkgver=0.5.1
pkgrel=2
pkgdesc="A Python module that creates call graphs for Python programs"
arch=('i686' 'x86_64')
url="http://pycallgraph.slowchop.com/pycallgraph/"
license=('GPL2')
depends=('python' 'graphviz')
source=(http://pycallgraph.slowchop.com/files/download/$pkgname-$pkgver.tar.gz)
md5sums=('2f57a14f637e87aabc7301e78941026c')

build() { 
    cd $srcdir/$pkgname-$pkgver
    python setup.py install --root=$pkgdir || return 1
    install -D -m644 man/pycallgraph.1 $pkgdir/usr/share/man/man1/pycallgraph.1
}
