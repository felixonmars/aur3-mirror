# Maintainer: Daniel Wallace <daniel.wallace at gatech dot edu>
_pypkg=pygooglevoice
pkgname=python2-$_pypkg
pkgver=0.5
pkgrel=1
pkgdesc="A Python API to interact with Google Voice"
arch=(any)
url="http://code.google.com/p/pygooglevoice/"
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')
conflicts=(python2-pygooglevoice-hg python-pygooglevoice python-pygooglevoice-hg)
replaces=(python2-pygooglevoice-hg python-pygooglevoice python-pygooglevoice-hg)
options=(!emptydirs)
source=(http://pygooglevoice.googlecode.com/files/$_pypkg-$pkgver.tar.gz
        http://pygooglevoice.googlecode.com/hg/LICENSE.txt
		settingspatch.diff)
md5sums=('3649e45b7615f5970be79db401205be6'
         'e82930030064ce9006c2dcc4b0c8ad46'
         'fe1359f65d983b701dadbfd7fc731745')
build() {
    cd "$srcdir/"
	patch -p0 -i settingspatch.diff
}
package(){
    cd "$srcdir/$_pypkg-$pkgver"
    python2 setup.py install --root=$pkgdir/ --optimize=1
    install -D -m644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

        
