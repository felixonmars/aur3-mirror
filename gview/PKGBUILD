# Maintainer: Eric Enns

pkgname=gview
pkgver=1.7
pkgrel=1
pkgdesc="Interactive Genome Viewer."
arch=('any')
url="https://www.gview.ca/"
license=('GPL2')
depends=('java-environment' 'sh')
source=("https://www.gview.ca/files/release/1.7/gview-1.7.zip" https://www.gview.ca/files/release/1.7/gview-icon.png "$pkgname.sh" "$pkgname.desktop")
md5sums=('c8ce06fde5666df22f20bf43ddb51196'
         'f5bdae02a05fe18055ae8218b7f17306'
         'cdd0bab567c326d2603cd33816b70ca3'
         'a06638a1319f7807a00d435f640722bb')

package() {
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 gview-icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  cd "$srcdir/gview"
  install -Dm644 $pkgname.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 Changelog "$pkgdir/usr/share/doc/$pkgname/Changelog"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname/examples"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname/example_data"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname/example_styles"
  install -Dm644 examples/* "$pkgdir/usr/share/doc/$pkgname/examples"
  install -Dm644 example_data/* "$pkgdir/usr/share/doc/$pkgname/example_data"
  install -Dm644 example_styles/* "$pkgdir/usr/share/doc/$pkgname/example_styles"
}
