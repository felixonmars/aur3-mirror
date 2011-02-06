# Contributor: MatToufoutu <mattoufootu[at]gmail.com>

pkgname=pyshadow
pkgver=0.2
pkgrel=2
pkgdesc="Python librarie to access the shadow passwords file"
url="http://www.twistedmatrix.com/users/z3p/files/"
arch=('i686' 'x86_64')
license=('GPL')

depends=('python2')

source=("http://www.twistedmatrix.com/users/z3p/files/$pkgname-$pkgver.tar.gz")
md5sums=('a0c9a88404c185824f8a2f4e598c6999')

build() {
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir
}
