# Maintainer : coolkehon < at gmail>
# Contributer: Daniel Graña <daniel@insophia.com>
pkgname=python2-shove
pkgver=0.3.0
pkgrel=1
pkgdesc='Python Common object storage frontend.'
arch=('i686' 'x86_64')
url='http://pypi.python.org/pypi/shove'
license=('BSD')
depends=('python2')
source=("http://pypi.python.org/packages/source/s/shove/shove-$pkgver.tar.gz")
md5sums=('146698b089b5d12b8bc3139ea660f53b')

build() {
  cd $srcdir/shove-$pkgver
  sed -i -e '/ez_setup/d' setup.py
  python2 setup.py install --root=$pkgdir || return 1
}
