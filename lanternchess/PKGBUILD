# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Bernhard F. Brodowsky <brodowsb at ethz dot ch>
pkgname=lanternchess
pkgver=1
pkgrel=1
pkgdesc="Java chess interface for ICC"
arch=(any)
url="http://www.lanternchess.com/"
license=('GPL')
depends=(java-runtime)
makedepends=(curl)
source=('lanternchess' 'http://www.lanternchess.com/lantern501.jar')
noextract=(${source[@]##*/})
md5sums=('216ceb3f9524d8fae1f5f7fd29df6920'
         '2fe5c78e4824479a689ee194d83cb070')

package() {
  install -Dm 644 $srcdir/lantern501.jar $pkgdir/usr/share/java/lanternchess/lantern.jar
  install -Dm 755 $startdir/lanternchess $pkgdir/usr/bin/lanternchess
}

# vim:set ts=2 sw=2 et:
