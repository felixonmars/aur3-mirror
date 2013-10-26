pkgname='python2-nsgt'
pkgver=0.13
pkgrel=1
pkgdesc="Python Non-stationary Gabor transform module"
url="http://grrrr.org/"
arch=('any')
license=('CCPL')
depends=('python2' 'python2-numpy')
source=(http://grrrr.org/data/dev/nsgt/nsgt-0.13.tar.gz)
md5sums=('930cc00b4b260cccc70a6f1a73e0710e')

build() {
    cd "$srcdir/nsgt-$pkgver/"
    python2 setup.py build || return 1
}
 
package() {
    cd "$srcdir/nsgt-$pkgver/"
    python2 setup.py install --root=$pkgdir || return 1 
}
