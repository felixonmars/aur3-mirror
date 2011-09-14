# Maintainer: Alfonso Saavedra "Son link" <sonlink.dourden@gmail.com
pkgname=python2-workerpool
pkgver=0.9.2
pkgrel=1
pkgdesc='Python multithreaded job distribution module.'
arch=('i686' 'x86_64')
url='http://code.google.com/p/workerpool/'
license=('GPL2')
depends=('python')
source=("http://workerpool.googlecode.com/files/workerpool-$pkgver.tar.gz")
md5sums=('42904070f1a58f2a7b7276b22134375b')

build() {
  cd $srcdir/workerpool-$pkgver
  python2 setup.py install --root=$pkgdir || return 1
}
