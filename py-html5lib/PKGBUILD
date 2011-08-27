# Contributor: Andrei Antoukh - niwi@niwi.be - http://www.niwi.be

pkgname=py-html5lib
pkgver=0.90
pkgrel=1
pkgdesc="A Python implementations of a HTML parser based on the WHATWG HTML5 specification."
arch=('i686' 'x86_64')
url="http://code.google.com/p/html5lib/"
license=('MIT')
depends=()

source=(http://html5lib.googlecode.com/files/html5lib-0.90.zip)
md5sums=('691e6b9ebe15b333a28280974b2ce432')

build() {
  cd "$srcdir/html5lib-$pkgver"
  python setup.py install --root=$startdir/pkg || return 1
}

# vim:set ts=2 sw=2 et:
