pkgname=ttf-hk-ming-uni
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Hong Kong (HK) unicode Ming font that contains Chinese characters unique to Hong Kong"
arch=('any')
source=(http://www.ogcio.gov.hk/ccli/unicode/hkscs/download/ming_uni.ttf.gz LICENSE)
install=$pkgname.install
md5sums=(336c9bc8944b34ba0e3eeb1f2999eb1f cc0ddd0a37fc92882cd38e12606e6b37)
license=('LICENSE')
url="http://www.ogcio.gov.hk/ccli/eng/hkscs/terms/terms34.html"

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
  cp $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
