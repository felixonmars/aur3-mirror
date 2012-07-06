# Original Contributor (python2-cvxopt): BinkyTheClown <binky_at_archlinux_dot_us>
# Modified by: Cristóvão D. Sousa <crisjss@gmail.com>
pkgname='python2-cvxopt-dsdp'
_pkgname='python2-cvxopt'
pkgver=1.1.5
pkgrel=1
pkgdesc="A free software package for convex optimization written in Python (with DSDP support)"
url="http://abel.ee.ucla.edu/cvxopt"
arch=('any')
license=('GPL3')
depends=('python2' 'lapack' 'dsdp')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}-${pkgver}.tar.gz::http://abel.ee.ucla.edu/cvxopt/download.php"
        "setup.py.patch")
md5sums=('f71e6e3e1c2e2264deb0887441783b05'
         '8fe1e5e573c5e06f28ac91b967d9e4c1')




build() {
    patch $srcdir/cvxopt-$pkgver/src/setup.py < $srcdir/setup.py.patch
    cd $srcdir/cvxopt-$pkgver/src
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir || return 1 
}
