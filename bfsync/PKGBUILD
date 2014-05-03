# Maintainer: Jan Hambrecht <jaham@gmx.net>

pkgname=bfsync
pkgver=0.3.6
pkgrel=1
pkgdesc="Bfsync is a file-synchronization tool which allows to keep a collection of big files synchronized on many machines."
arch=('i686' 'x86_64')
url="http://space.twc.de/~stefan/bfsync.php"
license=('GPL3')
depends=('python2' 'fuse' 'glib2' 'db' 'python2-setuptools' 'python2-pyliblzma' 'swig')
source=(http://space.twc.de/~stefan/$pkgname/$pkgname-$pkgver.tar.bz2
	Makefile_link_bdb.patch)
md5sums=('c3c4b1ae70b9bf9e1e40f8b475d83799'
         '89e2993df338a0298e348831515bf6dc')
build() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -p0 < "$srcdir"/Makefile_link_bdb.patch
  export PYTHON_VERSION="2.7"
  ./configure --prefix=${pkgdir}/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make install
  /usr/bin/python2 setup.py install --root=${pkgdir} --prefix=/usr
  cd fs
  /usr/bin/python2 setup.py install --root=${pkgdir} --prefix=/usr
  cd ..
}
