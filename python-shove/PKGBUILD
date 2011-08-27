# Maintainer: Daniel Graña <daniel@insophia.com>
pkgname=python-shove
pkgver=0.2.1
pkgrel=1
pkgdesc='Python Common object storage frontend.'
arch=('i686' 'x86_64')
url='http://pypi.python.org/pypi/shove'
license=('BSD')
depends=('python')
source=("http://pypi.python.org/packages/source/s/shove/shove-$pkgver.tar.gz")
md5sums=('2d5f189a0f6059b2d24f518472d14168')

build() {
  cd $srcdir/shove-$pkgver
  sed -i -e '/ez_setup/d' setup.py
  python setup.py install --root=$pkgdir || return 1
}
