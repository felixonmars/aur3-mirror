# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot com>

pkgname='organism-development'
pkgver='1.0.0pb1'
pkgrel=1
pkgdesc="Development component for Organism (PRE-BETA!)."
arch=('any')
url="https://github.com/kynikos/organism-development"
license=('GPL3')
depends=('organism')
source=("https://github.com/downloads/kynikos/organism-development/$pkgname-$pkgver.tar.gz")
md5sums=('3a1efa3de8014fbb020b22ac2c3150d1')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
    rm $pkgdir/usr/lib/python2.7/site-packages/organism/{,extensions/,plugins/}__init__.py{,c,o}
}
