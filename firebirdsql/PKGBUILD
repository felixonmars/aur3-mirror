# Maintainer: Cesar Ramone <cesar(at)archlinux(dot)org(dot)ve>
pkgname=firebirdsql
pkgver=0.4.0
pkgrel=1
pkgdesc="Python dbapi for firebird RDBMS."
arch=('i686' 'x86_64')
url="http://github.com/nakagami/pyfirebirdsql/"
license=('BSD')
makedepends=('python2')
source=("http://pypi.python.org/packages/source/f/firebirdsql/$pkgname-$pkgver.tar.gz")
md5sums=('fbe13631e1af7235bbde7ee12d0910c7')
build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --prefix=/usr --root=$startdir/pkg 
}
