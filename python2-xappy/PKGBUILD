# Maintainer: Xu Fasheng <fasheng.xu[AT]gmail.com>
pkgname=python2-xappy
pkgver=0.5
pkgrel=1
pkgdesc='A Python module providing an easy-to-use layer on top of the Xapian search engine'
arch=('i686' 'x86_64')
url='http://code.google.com/p/xappy/'
license=('GPL2')
depends=('python2' 'python2-xapian')
source=("http://xappy.googlecode.com/files/xappy-$pkgver.tar.gz")
md5sums=('cc0c6d5a8f9346ad90bd5f8183789c96')

build() {
  cd $srcdir/xappy-$pkgver
  python2 setup.py install --root=$pkgdir || return 1
}
