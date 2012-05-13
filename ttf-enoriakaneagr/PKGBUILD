# Maintainer: GordonGR <gordongr@freemail.gr>
pkgname=ttf-enoriakaneagr
pkgver=20120513
pkgrel=1
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
pkgdesc="Free Greek polytonic fonts from www.enoriakanea.gr"
arch=('any')
url="http://enoriaka.gr/index.php?option=content&task=view&id=748&Itemid=2"
source=("http://enoriaka.gr/fonts/enoriaka.gr_fonts_a.zip"
        "http://enoriaka.gr/fonts/enoriaka.gr_fonts_b.zip"
        "http://enoriaka.gr/fonts/enoriaka.gr_fonts_c.zip"
        "http://enoriaka.gr/fonts/enoriaka.gr_fonts_d.zip"
        "http://enoriaka.gr/fonts/enoriaka.gr_fonts_e.zip")
install=$pkgname.install
md5sums=('b5531484277148bd11c6c1efc32211f0'
         '9b9a42e985efd70835de7515c6dbb5f3'
         '4e52965e1d2d1c8def5a2c73b9fe4934'
         '1a82ba7c4c2c24fa94329f848d630444'
         'ba6f3480b53399077dd37b0e2a72a527')

package()
{
# Unpack the fonts
cd $srcdir

for _i in SKAdamPolUni_W_ok SKAeginaRomanPolUni_W skaegisnaospu_w skafroditepuw_i skagnespuw_ SKAircraftPolUni_W SKAlexanderOldStylePolUni_W SKAlicePolUni_W skamaliaoldpuw_ skandalepuw_ SKAndromedaPolUni_W SKAnoveroPolUni_W SKAplaPolUni_W SKApolloniaPolUni_W skarispuw_bl SKAthenaOFPolUni_W skathenianofpuw_i skatticaospuw_ SKAvantPolUni_W skbanderaspuw_ SKBaskervillPolUni_W SKBeautyPolUni_W-I SKBerkeleyPolUni_W SKBestowExtraPolUni_W SKBestowLightPolUni_W SKBodoniPolUni_W SKBookAntiquaPolUni_W SKBookManOldStylePolUni_W skbutterflypuw_ SKCarbonitePU__ SKCardoniPU_W SKCentury80PolUni_W SKCenturyGothicPolUni_W SKCenturyPolUni_W SKChiantiPolUni_W SKCollegePolUni_W SKDutchPolUni_W SKElitePU_W SKEuclidPolUni_W SKGaramondOldStyleUni_W SKGentiumPolUni_W SKGeorgiaPolUni_W SKGracePolUni_W skgrammataoldpuw_ skgreciaosnpuw_ SKHerculesPolEnUni_W SKMacedoniaOldStylePolUni_W SKOldBodoniPolUni_W SKOldTimesPolUni_W SKOptimaPolUni_W skparisospuw_ SKQueenCndPolUni_W SKQueenPolUni_W SKRichPUW_bi SKRonsonCndPolUni_W SKRonsonPolUni_W skruthpuw_bi SKSamsonPolUni_W SKSouvenirExtPolUn_W SKSouvenirLightPolUn_W SKSouvenirPolUni_W SKSouvExtraPolUn_W SKSouvLightPolUn_W SKSouvPolUn_W SKSwissPolUni_W SKTiffanyHeavyPolUni_W SKTiffanyPolUni_W SKVikingPolUni_W ;
do unzip -L $_i ;
done

# Install them
mkdir -p $pkgdir/usr/share/fonts/TTF/enoriakaneagr
cp *.ttf $pkgdir/usr/share/fonts/TTF/enoriakaneagr
}
