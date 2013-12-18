# Contributor: Jonathan Liu <net147@gmail.com
pkgname=zsi
pkgver=2.1a1
_realpkgver=2.1-a1
pkgrel=3
pkgdesc="a Python package that provides an implementation of SOAP messaging"
arch=('any')
url="http://pywebsvcs.sourceforge.net/zsi.html"
license=('GPL')
depends=('python2-lxml')
source=("http://downloads.sourceforge.net/pywebsvcs/ZSI-$_realpkgver.tar.gz")
md5sums=('a98e15e4d5a60f77714eb188de387c7c')

build() {
    cd "$srcdir/ZSI-$_realpkgver"
      python2 setup.py build
}

package() {
    cd "$srcdir/ZSI-$_realpkgver"
      python2 setup.py install --root="$pkgdir" -O1
}

# vim:set ts=2 sw=2 et:
