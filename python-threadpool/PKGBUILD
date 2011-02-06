# Maintainer: David Moore <davidm@sjsoft.com>
pkgname=python-threadpool
pkgver=1.2.5
pkgrel=1
pkgdesc="Easy to use object-oriented thread pool framework"
url="http://pypi.python.org/pypi/threadpool"
depends=('python')
arch=('x86_64' 'i686')
license=('MIT')

source=(http://pypi.python.org/packages/source/t/threadpool/threadpool-$pkgver.tar.bz2)
md5sums=('c1089bc82b37dbd720bfd19ffe3ffc46')

build() {
  cd $startdir/src/threadpool-$pkgver

  yes | python setup.py install --root=$startdir/pkg
  find $startdir/pkg -name '*.la' -exec rm {} \;
}

