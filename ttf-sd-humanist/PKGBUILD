pkgname=ttf-sd-humanist
pkgver=1.0
pkgrel=1
pkgdesc='SD Humanist is an optimization of the excellent Gentium Plus typeface'
arch=('any')
license=('custom:SIL OPEN FONT LICENSE')
url="https://github.com/hf/sd-humanist/"
depends=()
source=("https://github.com/hf/sd-humanist/releases/download/v${pkgver}/SDHumanist.otf"
        "https://raw.github.com/hf/sd-humanist/master/LICENSE.txt")
md5sums=('0b0ebdd83864042fb764089333268225'
         '17e9248aa10390121fc523a95a9dc915')
package() {
  install -d $pkgdir/usr/share/licenses/$pkgname/
  install -d $pkgdir/usr/share/fonts/TTF/

  install -m644 $srcdir/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/
  install -m644 *.otf $pkgdir/usr/share/fonts/TTF/
}
