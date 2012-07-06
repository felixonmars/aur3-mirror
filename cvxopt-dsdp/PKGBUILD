# Original Contributor (cvxopt): Gustavao A. Gomez Farhat <gustavo_gomez_farhat_at_gmail_dot_com>
# Modified by: Cristóvão D. Sousa <crisjss@gmail.com>
pkgname=cvxopt-dsdp
_pkgname=cvxopt  
pkgver=1.1.5
pkgrel=1
pkgdesc="A free software package for convex optimization written in Python (with DSDP support)"
url="http://abel.ee.ucla.edu/cvxopt"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('python' 'lapack' 'dsdp')
provides=($_pkgname)
conflicts=($_pkgname)
source=("http://abel.ee.ucla.edu/${_pkgname}/download.php"
        "setup.py.patch")
md5sums=('f71e6e3e1c2e2264deb0887441783b05'
         '8fe1e5e573c5e06f28ac91b967d9e4c1')


build() {
  patch $srcdir/cvxopt-$pkgver/src/setup.py < $srcdir/setup.py.patch
  cd $srcdir/$_pkgname-$pkgver/src
  python setup.py build || return 1
  python setup.py install --root=$pkgdir || return 1 
}
