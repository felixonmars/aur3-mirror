# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=f2py
pkgver=2.45.241_1926
pkgrel=3
pkgdesc="Fortran to Python interface generator"
arch=(i686)
url="http://cens.ioc.ee/projects/f2py2e/"
license=('LGPL')
depends=('python' 'python-numeric')
source=(http://cens.ioc.ee/projects/f2py2e/2.x/F2PY-$pkgver.tar.gz crackfortran.patch)
md5sums=('8aedac9cad32afdcddcfb026b6393ece'
         '8dc443d058d722737c5e69973970dd1f')

build() {
  cd $startdir/src/F2PY-$pkgver
  patch -p1 < ../crackfortran.patch
  python setup.py install --root=$startdir/pkg
}
