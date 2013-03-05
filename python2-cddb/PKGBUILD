# Maintainer: Felix Yan <felixonmars@gmail.com>

_pkgname=cddb
pkgname=python2-$_pkgname
pkgver=1.4
pkgrel=1
pkgdesc="Set of three modules to access the CDDB and FreeDB online databases of audio CD track titles and information"
arch=('i686' 'x86_64')
url='http://cddb-py.sourceforge.net/'
license=('GPL2')
depends=('python2')
source=(http://cddb-py.sourceforge.net/CDDB.tar.gz)
md5sums=('254698082bafe3030d07d88fb7e13fe2')

package() {
  cd "$srcdir/CDDB-$pkgver"
  python2 setup.py install --root="$pkgdir"
}
