# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Nelson Menon <nelsonmenon@gmail.com insanatorium.wordpress.com>
pkgname=freecol-unstable
pkgver=0.10.0
pkgrel=1
pkgdesc="A turn-based strategy game based on Colonization (development version)"
arch=('x86_64' 'i686')
url="http://www.freecol.org/"
license=('GPL')
depends=('java-runtime')
source=(
#"http://downloads.sourceforge.net/freecol/freecol-$pkgver-alpha2.zip"
        "fc.desktop"
				"fc.sh")
md5sums=(
#'fa1f48a9a0cf55f2c827f6920c8b1370'
         'b05847af7c8fcf2a9f58da1690e1aa4a'
         '370816c5a96ebaedbe0c745e41088515')         

build() {
  echo "Freecol-unstable is no longer publicly available"
  return 
  cd "$srcdir/freecol"
  install -Dm644 FreeCol.jar "$pkgdir/usr/share/java/$pkgname/FreeCol.jar"
  install -Dm644 FreeCol.pdf "$pkgdir/usr/share/doc/$pkgname/FreeCol.pdf"
  install -Dm644 freecol.xpm "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
  install -Dm644 ../fc.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 ../fc.sh "$pkgdir/usr/bin/$pkgname"
  cp -r data jars "$pkgdir/usr/share/java/$pkgname/"
  find "$pkgdir/usr/share/java/$pkgname" -type d -exec chmod 755 '{}' \;
  find "$pkgdir/usr/share/java/$pkgname" -type f -exec chmod 644 '{}' \;
}
# vim:set ts=2 sw=2 et:
