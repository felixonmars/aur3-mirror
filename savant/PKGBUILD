# Maintainer: Eric Enns <eric.enns@gmail.com>

pkgname=savant
pkgver=2.0.5
pkgrel=1
pkgdesc="Next-generation genome browser designed for the latest generation of genome data."
arch=('any')
url="http://genomesavant.com/p/savant/index"
license=('LGPL2.1')
depends=('java-environment' 'sh')
source=("http://genomesavant.com/p/savant/dist/v2_0_5/savant-zip-$pkgver.zip" http://genomesavant.com/p/assets/img/cover/savantlogo.png "$pkgname.sh" "$pkgname.desktop")
md5sums=('c255826c63ce49fa62cad2af5b2ef4e1'
         'eb1b4bc1229f469ed4c99c09b8d68561'
         'b65aa23d9dd87d63f642f5b4ffd0bc1d'
         '2e43ade0050c44d63a89746844fc01db')

package() {
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 savantlogo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  cd "$srcdir/savant-zip-$pkgver"
  install -Dm644 "$pkgname-core-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname-core-$pkgver.jar"
  install -dm755 "$pkgdir/usr/share/java/$pkgname/lib"
  install -m644 lib/* "$pkgdir/usr/share/java/$pkgname/lib"
  install -dm755 "$pkgdir/usr/share/java/$pkgname/plugins"
  install -m644 plugins/* "$pkgdir/usr/share/java/$pkgname/plugins"
}
