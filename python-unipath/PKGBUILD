# Contributor: Ryan Coyner <rcoyner@gmail.com>
# Current maintainer: Kozec <kozec at kozec dot com>

pkgname=python-unipath
pkgver=0.2.1
pkgrel=3
pkgdesc="Python library for calculating pathname and filesystem access."
arch=('i686' 'x86_64')
depends=('python2')
url="http://sluggo.scrapping.cc/python/unipath/"
license=('Python')
source=(http://sluggo.scrapping.cc/python/unipath/Unipath-$pkgver.tar.gz)
md5sums=('da24f0e0d39931df3fc61f2db09d4e57')

build() {
    cd $srcdir/Unipath-$pkgver
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir || return 1
}
