# Contributor: Johannes Dewender arch at JonnyJD dot net

pkgname=python-pymetrics
pkgver=0.8.1
pkgrel=1
pkgdesc="produces metrics for Python programs"
arch=(any)
url="http://pymetrics.sourceforge.net/"
license=('GPL2')
depends=('python')
options=(!emptydirs)
source=(http://downloads.sourceforge.net/pymetrics/pymetrics-$pkgver.tar.gz)
md5sums=('2413ea3d414e8a2b88b4a3d2aa32d835')

build() {
	  cd $srcdir/pymetrics-$pkgver
	  python setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
