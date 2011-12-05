# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot com>

pkgname='organism'
pkgver='1.0.0pb1'
pkgrel=1
pkgdesc="A simple and extensible outliner written in Python (PRE-BETA!)."
arch=('any')
url="https://github.com/kynikos/organism"
license=('GPL3')
depends=('wxpython'
         'python2-configfile'
         'python2-texthistory'
         'python2-plural'
         'python2-loggingext')
optdepends=('organism-organizer: adds personal organizer capabilities'
            'organism-development: development tools for beta testers')
install="$pkgname.install"
source=("https://github.com/downloads/kynikos/organism/$pkgname-$pkgver.tar.gz")
md5sums=('a243d18c2900312634c205278c25239f')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
}
