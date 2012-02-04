# Contributor: Claudio Riva <firetux83@gmail.com>

pkgname=cddb
pkgver=1.4
pkgrel=2
pkgdesc="set of three modules to access the CDDB and FreeDB online databases of audio CD track titles and information"
url="http://cddb-py.sourceforge.net/"
depends=('python')
source=(http://cddb-py.sourceforge.net/CDDB.tar.gz)
md5sums=('254698082bafe3030d07d88fb7e13fe2')

build() {
  cd $startdir/src/CDDB-$pkgver
  python setup.py install --root=$startdir/pkg/
}
