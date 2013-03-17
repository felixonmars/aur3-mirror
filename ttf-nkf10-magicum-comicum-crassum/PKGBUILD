pkgname=ttf-nkf10-magicum-comicum-crassum
pkgver=1.12
pkgrel=1
pkgdesc="A Madoka rune font in a thick comic style."
arch=('any')
url="http://www.pixiv.net/member_illust.php?mode=medium&illust_id=18599749"
license=("custom")
depends=('fontconfig' 'xorg-font-utils')
install='install'
source=('http://hwm3.gyao.ne.jp/shiroi-niwatori/nkf10_magicum_comicum_crassum.zip')
sha256sums=('5748d15786739df20c15b69ec8d1d512e02762614584929d7c8f48cfd0800534')

package() {
 cd nkf10_magicum_comicum_crassum
 install -Dm644 nkf10_magicum_comicum_crassum.ttf $pkgdir/usr/share/fonts/TTF/nkf10_magicum_comicum_crassum.ttf
 install -Dm644 readme.txt $pkgdir/usr/share/doc/nkf10-magicum-comicum-crassum/readme.txt
}
