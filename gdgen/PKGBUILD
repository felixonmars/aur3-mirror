# Maintainer: jsteel <mail at jsteel dot org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=gdgen
pkgver=0.0.3
pkgrel=3
pkgdesc="A PyGTK+ frontend for the DGEN Sega Genesis/Mega Drive emulator"
arch=('any')
url="http://sourceforge.net/projects/$pkgname"
license=('GPL')
source=(http://downloads.sourceforge.net/$pkgname/${pkgname}_${pkgver}_source.tar.gz
        $pkgname.png
        $pkgname.desktop
        $pkgname.sh)
md5sums=('93f55c1395d7195ae15383b218cae6f0'
         '2e2613af69dec8e4dea18d773edadf41'
         '4e5f45bf6f436ba79f54f65b7a776848'
         'ede60a52e0ffa4c1edbd8d97bc3711f0')

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir"/usr/share/$pkgname
  install -m644 about.py gdgen.glade gdgen.py icon.png "$pkgdir"/usr/share/$pkgname/
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
