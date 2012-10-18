pkgname=gnomecatalog
pkgver=0.3.4.2
pkgrel=1
arch=('i686')
pkgdesc="CD and DVD Catalog Software for gnome Project"
arch=('i686' 'x86_64')
url="http://gnomecatalog.sourceforge.net/"
license=('GPL')
depends=('gnome-python' 'python2-pysqlite' 'pyxml' 'kaa-metadata')
source=("http://downloads.sourceforge.net/gnomecatalog/gnomecatalog-$pkgver.tar.bz2")
md5sums=('ab5d51e0bdc8bc14c1c4d34c9ca337d3')

build() {
	  cd $startdir/src/$pkgname-$pkgver
	  python2 ./setup.py install --prefix=/usr --root=$startdir/pkg
    }

    
