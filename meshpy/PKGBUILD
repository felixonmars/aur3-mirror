# Contributor: Melancholy_Dream <Melancholy_Dream@write.su>
pkgname=meshpy
pkgver=2011.1
pkgrel=1
pkgdesc="quality triangular and tetrahedral mesh generation for Python"
arch=('i686')
url="http://pypi.python.org/pypi/MeshPy/"
license=('GPL')
groups=()
depends=('python' 'boost') # Or python2 if you need it for Python2
makedepends=('python-distribute')
source=(http://pypi.python.org/packages/source/M/MeshPy/MeshPy-$pkgver.tar.gz)
md5sums=('ecd127a22d35b0542caaa58ed958acb2')

build() {
    cd "$srcdir/MeshPy-$pkgver"
    
    python configure.py --boost-python-libname=boost_python
    python setup.py install --root=$pkgdir
}
