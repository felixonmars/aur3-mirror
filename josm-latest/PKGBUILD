# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>, caemir <benjamin@colard.info>, Eichi <mail@der-eichi.de>
# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=josm-latest
pkgver=6800
pkgrel=1
pkgdesc="Nightly build of an editor for OpenStreetMap written in Java."
arch=('any')
url="http://josm.openstreetmap.de/"
license=('GPL')
depends=('java-runtime')
makedepends=('unzip')
provides=('josm')
conflicts=('josm')
source=('http://josm.openstreetmap.de/josm-latest.jar'
        'http://josm.openstreetmap.de/browser/trunk/images/logo.png?format=raw'
        'josm.desktop'
        'josm.sh')
md5sums=('SKIP'
         'SKIP'
         'e2b8c820100f3403a6cd10c1239d659a'
         'edbde08af05aa8ee0c2b930041c5dce5')
noextract=('josm-latest.jar')

pkgver() {
    unzip -p josm-latest.jar REVISION | sed -n 's/Revision: \([0-9]*\)/\1/p'
}

package() {
  install -D -m644 josm-latest.jar $pkgdir/usr/share/java/josm/josm.jar
  install -D -m644 josm.desktop $pkgdir/usr/share/applications/josm.desktop
  install -D -m755 josm.sh $pkgdir/usr/bin/josm
  install -D -m644 'logo.png?format=raw' $pkgdir/usr/share/pixmaps/josm.png
}
