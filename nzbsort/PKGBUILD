# Maintainer: kevku <kevku@gmx.com>
pkgname=nzbsort
pkgver=0.1.1
pkgrel=1
pkgdesc="NZB files alpha sorter"
arch=('any')
url="http://tamentis.com/projects/nzbsort/"
license=('ISCL')
depends=('python2')
source=("http://pypi.python.org/packages/source/n/nzbsort/nzbsort-0.1.1.tar.gz")
sha256sums=('ccc06742fafe6a97331e2f7842495da152adc985dcabe2a6f8bbdb69772ddda2')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
