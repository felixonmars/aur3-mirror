# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot com>

pkgname='organism-organizer'
pkgver='1.0.0pb1'
pkgrel=1
pkgdesc="Organizer component for Organism (PRE-BETA!)."
arch=('any')
url="https://github.com/kynikos/organism-organizer"
license=('GPL3')
depends=('organism')
install="$pkgname.install"
source=("https://github.com/downloads/kynikos/organism-organizer/$pkgname-$pkgver.tar.gz")
md5sums=('879b5f78ddc617431b4cee1e3bd73dbc')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
    rm $pkgdir/usr/lib/python2.7/site-packages/organism/{,extensions/,plugins/}__init__.py{,c,o}
}
