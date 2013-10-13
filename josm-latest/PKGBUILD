# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>, caemir <benjamin@colard.info>, Eichi <mail@der-eichi.de>
# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=josm-latest
pkgver=latest
pkgrel=4
pkgdesc="Nightly build of an editor for OpenStreetMap written in Java."
arch=('any')
url="http://josm.openstreetmap.de/"
license=('GPL')
depends=('java-runtime')
makedepends=('wget')
conflicts=('josm')
source=('josm.desktop' 'josm.sh')
md5sums=('e2b8c820100f3403a6cd10c1239d659a'
         'a497395e555e22c5e0412ebbab911737')

_jar='http://josm.openstreetmap.de/josm-latest.jar'
_logo='http://josm.openstreetmap.de/browser/trunk/images/logo.png?format=raw'

build() {
  cd "$srcdir"

  msg "Downloading files..."

  wget -O josm-latest.jar "$_jar"
  wget -O logo.png "$_logo"
}

package() {
  cd "$srcdir"
  
  install -D -m644 josm-latest.jar $pkgdir/usr/share/java/josm/josm.jar
  install -D -m644 josm.desktop $pkgdir/usr/share/applications/josm.desktop
  install -D -m755 josm.sh $pkgdir/usr/bin/josm
  install -D -m644 logo.png $pkgdir/usr/share/pixmaps/josm.png
}
