# Contributor: JWC <bulk aaa aaatt tttt jwcxz dddd 0ttt c0m>

_pypkg=pygooglevoice
pkgname=python-$_pypkg
pkgver=0.5
pkgrel=1
pkgdesc="A Python API to interact with Google Voice"
arch=(any)
url="http://code.google.com/p/pygooglevoice/"
license=('BSD')
depends=('python')
options=(!emptydirs)
source=(http://pygooglevoice.googlecode.com/files/$_pypkg-$pkgver.tar.gz
        http://pygooglevoice.googlecode.com/hg/LICENSE.txt)
md5sums=('3649e45b7615f5970be79db401205be6'
         'e82930030064ce9006c2dcc4b0c8ad46')
install=

build() {
    cd $srcdir/$_pypkg-$pkgver
    python setup.py install --root=$pkgdir/ --optimize=1 || return 1

    install -D -m644 $srcdir/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

        
