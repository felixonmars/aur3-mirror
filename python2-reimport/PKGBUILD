# Maintainer: Rodney Price <rod@thirdoption.info>

pkgname=("python2-reimport")
provides=("python2-reimport")
pkgver=1.2
pkgrel=1
pkgdesc="A full-featured replacement for Python's reload function.'"
url="http://code.google.com/p/reimport"
source=("http://reimport.googlecode.com/files/reimport-$pkgver.tar.gz")
depends=("python2")
makedepends=("python2-distribute")
arch=("any")
license=("MIT")
md5sums=('f14aa0f6228573c587b731a9b6711d5e')

build() {
    cd "${srcdir}/reimport-${pkgver}"
    python2 setup.py install --root="${pkgdir}"
}

# vim: set noet ff=unix:
