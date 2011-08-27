# Current maintainer : Kozec < kozec at kozec dot com >
# Contributor : Jon Kristian Nilsen <jonkristian@archaudio.org>

pkgname=python-googlechart
_pkgname=pygooglechart
pkgver=0.2.1
pkgrel=2
pkgdesc="pygooglechart is a complete Python wrapper for the Google Chart API."
arch=('i686' 'x86_64')
url="http://pygooglechart.slowchop.com/"
depends=('python2')
license=('GPL')

source=("http://pygooglechart.slowchop.com/files/download/${_pkgname}-${pkgver}.tar.gz")
md5sums=('ec6e1ddd678485c7971c8c0b5dd3cec6')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --root=$pkgdir --prefix=/usr || return 1
}
