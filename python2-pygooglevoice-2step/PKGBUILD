# Maintainer: Daniel Wallace <daniel.wallace at gatech dot edu>
_pypkg=pygooglevoice
pkgname=python2-$_pypkg-2step
pkgver=0.5
pkgrel=1
pkgdesc="A Python API to interact with Google Voice"
arch=(any)
url="http://code.google.com/p/pygooglevoice/"
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')
conflicts=(python2-pygooglevoice-hg python-pygooglevoice python-pygooglevoice-hg python2-pygooglevoice)
replaces=(python2-pygooglevoice-hg python-pygooglevoice python-pygooglevoice-hg python2-pygooglevoice)
options=(!emptydirs)
install=$_pypkg.install
source=(http://pygooglevoice.googlecode.com/files/$_pypkg-$pkgver.tar.gz
        http://pygooglevoice.googlecode.com/hg/LICENSE.txt
		authfix.diff
		$_pypkg.install
		)
md5sums=('3649e45b7615f5970be79db401205be6'
         'e82930030064ce9006c2dcc4b0c8ad46'
         '34f4287cbc226bc99708f894d4b52047'
         'df36cd4a107adacbedeaf1580345e5a2')

build() {
    cd "$srcdir/"
	patch -p0 -i authfix.diff
}
package(){
    cd "$srcdir/$_pypkg-$pkgver"
    python2 setup.py install --root=$pkgdir/ --optimize=1
    install -D -m644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

        
