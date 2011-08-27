# Contributor: Cyker Way <cykerway@gmail.com>

pkgname=python2-scanf
pkgver=1.2
pkgrel=1
pkgdesc="scanf provides formatted input from standard input, strings, or files, using a format-string syntax that's similar to C's scanf()."
arch=('i686' 'x86_64')
url="https://hkn.eecs.berkeley.edu/~dyoo/python/scanf/"
license=("NewBSD")
depends=("python2")
makedepends=("setuptools")
source=("https://hkn.eecs.berkeley.edu/~dyoo/python/scanf/scanf-${pkgver}.tar.gz")
md5sums=('e4c3ff4629933d5ec854743bf77017ca')

build() {
    cd "$srcdir/scanf-$pkgver"
    python2 setup.py install --root="$pkgdir" --prefix=/usr
}
