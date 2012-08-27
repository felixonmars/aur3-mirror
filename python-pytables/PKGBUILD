# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Sebastien Binet <binet@cern.ch>
pkgname=python-pytables
pkgver=2.4.0
pkgrel=2
arch=("i686" "x86_64")
pkgdesc="PyTables is a package for managing hierarchical datasets and designed to efficiently and easily cope with extremely large amounts of data"
url="http://www.pytables.org"
license=("BSD")
depends=('lzo2' 'hdf5' 'python2-numexpr' 'cython2')
source=("http://sourceforge.net/projects/pytables/files/pytables/${pkgver}/tables-$pkgver.tar.gz")
md5sums=('ec20938fca8b579020c5a4cc567caf7c')

build() {
  cd "$srcdir"/tables-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/tables-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

