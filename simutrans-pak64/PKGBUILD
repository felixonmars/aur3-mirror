# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: JD Steffen <jd at steffennet dot org>

pkgname=simutrans-pak64
pkgver=111.3
_pkgver=111-3
pkgrel=1
pkgdesc="A low resolution graphics set for Simutrans"
arch=('any')
url="http://simutrans.com/"
license=('custom:Artistic License')
options=('!strip')
source=(http://downloads.sourceforge.net/simutrans/simupak64-$_pkgver.zip
        license.txt)
md5sums=('32ae8dfc6b59358b999068679a3236eb'
         '9cf3801b1349ac93b24c1515c9e5bb0a')

package() {
  cd "$srcdir"
  chmod -R 644 simutrans

  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans"
  cp -r simutrans/pak "$pkgdir/usr/share/games/simutrans"

  #license
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

  find "$pkgdir" -type f -exec chmod 644 {} \;
  find "$pkgdir" -type d -exec chmod 755 {} \;
}
