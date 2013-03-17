pkgname=ttf-nkf11-magicum-texturae
pkgver=1.02
pkgrel=1
pkgdesc="A Madoka rune font in a blackletter style."
arch=('any')
url="http://www.pixiv.net/member_illust.php?mode=medium&illust_id=18854083"
license=("custom")
depends=('fontconfig' 'xorg-font-utils')
install='install'
source=('http://hwm3.gyao.ne.jp/shiroi-niwatori/nkf11_magicum_texturae.zip')
sha256sums=('e9c55a98281de13468f612e268608353cbd894e73295aa3e921b914aeada2350')

package() {
 cd nkf11_magicum_texturae
 install -Dm644 nkf11_magicum_texturae.ttf $pkgdir/usr/share/fonts/TTF/nkf11_magicum_texturae.ttf
 install -Dm644 readme.txt $pkgdir/usr/share/doc/nkf11_magicum_texturae/readme.txt
}
