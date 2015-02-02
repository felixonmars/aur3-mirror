# Maintainer: Dmitry ixaphire_at-gmail-dot+com 

pkgname=visionegg
pkgver=1.2.1
pkgrel=2
pkgdesc="Powerful, flexible, and free way to produce stimuli for vision research experiments."
arch=('i686' 'x86_64')
url="http://www.visionegg.org/"
license=('LGPL')
depends=('python2' \
         'python2-opengl' \
         'python2-pygame' \
         'python2-pillow' \
         'python2-numpy' \
         'python2-numarray')
source=(http://downloads.sourceforge.net/project/visionegg/visionegg/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('03d0d58a3a288802504a0dcc5342cd9b')

prepare() {
    cd "$srcdir"/$pkgname-$pkgver
    # numpy has no .oldnumeric anymore
    # pillow has different structure
    find . -name '*.py' -exec sed -i -e 's/numpy.oldnumeric/numarray/g' \
                                     -e 's/import Image/from PIL import Image/' \
                                     -e 's/import _imaging/from PIL import _imaging/' \
                                     {} \;
}

build() {
    cd "$srcdir"/$pkgname-$pkgver
    python2 setup.py build
}

package() { 
    cd "$srcdir"/$pkgname-$pkgver
    python2 setup.py install --root="$pkgdir"
}
