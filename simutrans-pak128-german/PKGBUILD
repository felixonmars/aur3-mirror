# Contributor: Christian Hausknecht <christian.hausknecht@gmx.de>
# Contributor: Johannes Zellner <johannes@nebulon.de>
# http://sourceforge.net/projects/simutrans/files/PAK128.german/PAK128.german_111.2/PAK128.german_0.3_111.2.zip/download

#http://downloads.sourceforge.net/project/simutrans/PAK128.german/PAK128.german_0.4_111.3/PAK128.german_0.4_111.3.zip


pkgname=simutrans-pak128-german
pkgver=0.6.1_112.x
pkgrel=1
pkgdesc="A high resolution graphics set for Simutrans with german settings"
arch=(any)
url="http://www.simutrans-forum.de/forum/board.php?boardid=42"
license=('custom:Artistic License')
depends=('simutrans>=111.2')
provides=("simutrans-pak128-german=$pkgver")
options=(!strip)
source=(http://downloads.sourceforge.net/project/simutrans/PAK128.german/PAK128.german_$pkgver/PAK128.german_$pkgver.zip
        LICENSE.txt)
md5sums=(c3956266a4d6721cda566d542ceb8c6d
        88f7c4912aebe9740e31585406f2bf7b)

        
package() {
  cd "$srcdir"

  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans"
  cp -r simutrans/PAK128.german "$pkgdir/usr/share/games/simutrans"

  #license
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
