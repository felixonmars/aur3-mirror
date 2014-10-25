# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Ruslan Nabioullin <rnabioullin at gmail dot com>

pkgname=python2-pykcs11
pkgver=1.3.0
pkgrel=1
pkgdesc="A full PKCS #11 (i.e., Cryptoki) wrapper for Python."
arch=('any')
url="http://www.bit4id.org/trac/pykcs11/"
license=('GPL2')
depends=('python2')
makedepends=('swig')
source=("http://downloads.sf.net/project/pkcs11wrap/pykcs11/pykcs11-$pkgver/PyKCS11-$pkgver.tar.gz"
        Makefile.patch)
md5sums=('819f93e6f58bc8b89374b7e6357243a6'
         '9d46916b85b9368689693c53a91e8a4b')


prepare() {
    cd $srcdir/PyKCS11-$pkgver
    patch <$srcdir/Makefile.patch
}

build() {
    cd $srcdir/PyKCS11-$pkgver
    make build
}

package() {
    cd $srcdir/PyKCS11-$pkgver
    make install DESTDIR=$pkgdir
}
