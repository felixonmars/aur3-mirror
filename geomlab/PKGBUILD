# Maintainer: Jetbeard <jetbeard@gmail.com>
pkgname=geomlab
pkgver=2.0
pkgrel=1
pkgdesc="A functional programming language with pictures as datatypes, used for education."
arch=('any')
url="http://www.cs.ox.ac.uk/$pkgname/home.html"
depends=('java-runtime')
license=('BSD')
source=(http://www.cs.ox.ac.uk/$pkgname/$pkgname.jar LICENSE $pkgname.sh $pkgname.desktop) 
noextract=($pkgname.jar)

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 $pkgname.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -D $pkgname.sh "$pkgdir/usr/bin/$pkgname"
}

md5sums=('7b4ef1160fb833643aa5e3e2c148c72d'
         '38b2e1ce77881e645185c96615591543'
         '46a329aad41b80644c88211c94ecce3d'
         '5123195e1cf7bc65fee7a026b77c7312')
