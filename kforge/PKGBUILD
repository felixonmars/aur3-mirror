# PKGBUILD,v 0.1 2007/10/03 NiCoS
# Contributor: NiCoS <nsteinmetz@gmail.com>
# Contributor: mathieui <mathieui AT mathieui.net>
pkgname=kforge
pkgver=0.17
pkgrel=1
pkgdesc="An open-source system for managing software and knowledge projects"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.kforgeproject.com/"
depends=('python' 'setuptools' 'mod_python' 'apache' 'python-egenix-mx-base' 'python-sqlobject' 'python-routes' 'python-simplejson')
source=(http://pypi.python.org/packages/source/k/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('e2341aa221a4194b55c15419c3d8b8e8')
install=kforge.install

build() { 
	  cd $startdir/src/kforge-$pkgver
	    python setup.py install --root=$startdir/pkg || return 1
    }
