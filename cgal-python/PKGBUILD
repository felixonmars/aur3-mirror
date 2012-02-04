# Contributor: Dmitriy Morozov <archlinux@foxcub.org> 
pkgname=cgal-python
pkgver=0.9.4
_pkgver=0.9.4-beta1
pkgrel=1 
pkgdesc="Python bindings for CGAL."
url="http://cgal-python.gforge.inria.fr/"
arch=('i686' 'x86_64')
license="GPL" 
depends=('python' 'cgal') 
source=(https://gforge.inria.fr/frs/download.php/19498/$pkgname-$_pkgver.tar.gz)
md5sums=('6e5199dda2a791717b8184d5628f1dcc')

build() { 
 PYTHON_INC=`python -c "from distutils import sysconfig; print sysconfig.get_python_inc()"` 
 PYTHON_LIB=`python -c "from distutils import sysconfig; print sysconfig.get_python_lib()"` 

 cd $startdir/src/$pkgname-$_pkgver
 make CGAL_CXXFLAGS="-I /opt/cgal/include -I $PYTHON_INC"
 make package
 mkdir -p $startdir/pkg/$PYTHON_LIB/CGAL
 install -m644 $startdir/src/$pkgname-$_pkgver/cgal_package/CGAL/* $startdir/pkg/$PYTHON_LIB/CGAL
}
