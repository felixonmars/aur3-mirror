#Maintainer: Daniel Wallace < daniel.wallace at gatech dot edu >
pkgname=rodentsrevenge
pkgver=20120327
pkgrel=1
pkgdesc="rodents revenge from windows '98 (afaik) (with wine)"
arch=('any')
url="http://www.pcgaming.ws/viewgame.php?game=rodents_revenge"
license=('unknown')
depends=('wine')
provides=('rodentsrevenge')
source=(http://www.pcgaming.ws/games/rodents_revenge.zip
        $pkgname.sh)

package() {
  cd "$srcdir/"
  install -d "$pkgdir/usr/share/$pkgname"
  cp -dpr --no-preserve=ownership "$srcdir/{field100.dll,rodent.exe,rodent.hlp,vbrun100.dll,WEPUTIL.DLL}" "$pkgdir/usr/share/$pkgname"
  install -D -m777 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
md5sums=('6fa6e4212724aed40f2984529ed670be'
         '517b4c1845f92a237ab3febf9ada62e7')
