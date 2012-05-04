# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: JD Steffen <jd at steffennet dot org>

pkgname=simutrans-pak128
pkgver=2.1.0
_pkgver=111.2
pkgrel=1
pkgdesc="A high resolution graphics set for Simutrans"
arch=(any)
url="http://simutrans.com/"
license=('custom:Artistic License')
provides=("simutrans-pak64=$_pkgver")
options=(!strip)
source=(http://downloads.sourceforge.net/simutrans/pak128-$pkgver--$_pkgver.zip
        LICENSE.txt)
md5sums=('edccbd05e2964e449eee715d089f5f65'
         '88f7c4912aebe9740e31585406f2bf7b')

package() {
  cd "$srcdir"

  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans"
  cp -r simutrans/pak128 "$pkgdir/usr/share/games/simutrans"

  #license
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
