# Maintainer: Eric Enns <eric.enns@gmail.com>

pkgname=medsavant
pkgver=1.2.2
pkgrel=1
pkgdesc="Search egine for genetic variants."
arch=('any')
url="http://genomesavant.com/p/medsavant/index"
license=('LGPL2.1')
depends=('java-environment' 'sh')
source=("http://nexus.cs.toronto.edu/nexus/service/local/repositories/releases/content/edu/toronto/cs/medsavant/medsavant-client-zip/$pkgver/medsavant-client-zip-$pkgver.zip" http://genomesavant.com/p/assets/img/cover/medsavantlogo.png "$pkgname.sh" "$pkgname.desktop")
md5sums=('441a5bfdd52828bafe5a10211a4d9d91'
         '36e82b9448d3aa893478775c01c75ccf'
         '2195ac2fe2d5fc4ca4d5541a6c519b30'
         '36f7897218dfc56ed26bd7840820bd53')

package() {
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 medsavantlogo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  cd "$srcdir/medsavant-client-zip-$pkgver"
  install -Dm644 "$pkgname-client-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname-client-$pkgver.jar"
  install -dm755 "$pkgdir/usr/share/java/$pkgname/lib"
  install -m644 lib/* "$pkgdir/usr/share/java/$pkgname/lib"
}
