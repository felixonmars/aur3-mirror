# Contributor: Bill Zhechuan Chen <chen.bill.bill(at)gmail.com> 

pkgname=simutrans-pak128-britain
pkgver=1.14
_pkgver=112
pkgrel=0
pkgdesc="A high resolution graphics set for Simutrans"
arch=(any)
url="http://forum.simutrans.com/index.php?board=51.0"
license=('custom:Artistic License')
provides=("simutrans-pak64=$_pkgver")
options=(!strip)
source=(http://downloads.sourceforge.net/simutrans/pak128.Britain.$pkgver-$_pkgver-$pkgrel.zip
        LICENSE.txt)
md5sums=('b63f765609262475e3f0d6a6dfcfdca7'
         '88f7c4912aebe9740e31585406f2bf7b')

package() {
  cd "$srcdir"

  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans"
  cp -r pak128.Britain "$pkgdir/usr/share/games/simutrans"

  #license
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
