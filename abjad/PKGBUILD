# Maintainer:  Bernardo Barros <bernardobarros@gmail.com>

pkgname=abjad
_realname=Abjad
pkgver=1.1.1
pkgrel=1
pkgdesc="Abjad: a Python API for Formalized Score Control"
url="http://code.google.com/p/abjad/"
arch=(any)
license=('GPL')
depends=('python2' 'lilypond')
makedepends=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://pypi.python.org/packages/source/A/Abjad/$_realname-$pkgver.tar.gz")
md5sums=('2e4efa633e3440fc689b46cd78764045')

build() {
    cd $srcdir/$_realname-$pkgver
    python2 setup.py install --root=$pkgdir/ --optimize=1
}