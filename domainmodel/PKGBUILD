# PKGBUILD,v 0.1 2007/10/03 NiCoS
# Contributor: NiCoS <nsteinmetz@gmail.com>

pkgname=domainmodel
pkgver=0.2
pkgrel=2
pkgdesc="toolkit for enterprise application frameworks"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.kforgeproject.com/"
depends=('setuptools' 'python')
source=(http://www.kforgeproject.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('43cfd867bb20c3d24b2129dce1157b14')

build() { 
	cd $startdir/src/$pkgname-$pkgver
	    python setup.py install --root=$startdir/pkg || return 1
    }
