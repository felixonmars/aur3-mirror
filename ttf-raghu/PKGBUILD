#Contributor: Phrodo_00 <phrodo.00@gmail.com>
pkgname=ttf-raghu
pkgver=1.0
pkgrel=2
pkgdesc="OpenType fonts for indic scripts"
license=('GPL')
url="http://www.cdacmumbai.in/projects/indix/n_download.shtml"
depends=('fontconfig' 'xorg-font-utils')
provides=('look_of_disapproval')
arch=('any')
source=(http://www.cdacmumbai.in/projects/indix/RaghuFonts/RKRaghuHindi_ship.ttf \
http://www.cdacmumbai.in/projects/indix/RaghuFonts/RVRaghuBengali_ship.ttf \
http://www.cdacmumbai.in/projects/indix/RaghuFonts/RORaghuPunjabi_ship.ttf \
http://www.cdacmumbai.in/projects/indix/RaghuFonts/RVRaghuGujarati_ship.ttf \
http://www.cdacmumbai.in/projects/indix/RaghuFonts/RRRaghuOriya_ship.ttf \
http://www.cdacmumbai.in/projects/indix/RaghuFonts/RRRaghuTamil_ship.ttf \
http://www.cdacmumbai.in/projects/indix/RaghuFonts/RORaghuTelugu_ship.ttf \
http://www.cdacmumbai.in/projects/indix/RaghuFonts/RORaghuKannada_ship.ttf \
http://www.cdacmumbai.in/projects/indix/RaghuFonts/RRRaghuMalayalam_ship.ttf \
)
install=$pkgname.install

md5sums=('9a21093b639d23e818376a148c5f250d'
         'c6f3a48bfb629d3440139d6d3b0c4f9f'
         'fa962dc6a5067ad43c988ef0c688747b'
         'cf4d7feb861eb002bffe97b6627b7720'
         '1936b9baf8e88ad3a67985ae9065029b'
         'dfcaa976db3181017e55b0c17a335a2b'
         '23b2c0439c3cfab41daf45b6081652a3'
         '0aee9ffef89cde44795ea59e8f4c6ac0'
         '79ff19b53a92607768af4e36465468e3')

package()
{
    mkdir -p $pkgdir/usr/share/fonts/TTF
    cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
