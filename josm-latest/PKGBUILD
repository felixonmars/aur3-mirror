# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>, caemir <benjamin@colard.info>, Eichi <mail@der-eichi.de>
# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=josm-latest
pkgver=6320
pkgrel=1
pkgdesc="Nightly build of an editor for OpenStreetMap written in Java."
arch=('any')
url="http://josm.openstreetmap.de/"
license=('GPL')
depends=('java-runtime')
conflicts=('josm')
source=('http://josm.openstreetmap.de/josm-latest.jar'
        'http://josm.openstreetmap.de/browser/trunk/images/logo.png?format=raw'
        'josm.desktop'
        'josm.sh')
md5sums=('SKIP'
         '16c79ebbacbe5a30bc7cae5260ac149d'
         'e2b8c820100f3403a6cd10c1239d659a'
         'a497395e555e22c5e0412ebbab911737')

pkgver() {
    unzip -p josm-latest.jar REVISION | sed -n 's/Revision: \([0-9]*\)/\1/p'
}

package() {
  install -D -m644 josm-latest.jar $pkgdir/usr/share/java/josm/josm.jar
  install -D -m644 josm.desktop $pkgdir/usr/share/applications/josm.desktop
  install -D -m755 josm.sh $pkgdir/usr/bin/josm
  install -D -m644 'logo.png?format=raw' $pkgdir/usr/share/pixmaps/josm.png
}
