# Contributor: acounto <acounto@kamikakushi.net>

pkgname=ttf-misaki
pkgver=20120603
pkgrel=1
pkgdesc="Japanese 8bit like TrueType fonts created by num_kadoma"
arch=('any')
url="http://www.geocities.jp/littlimi/misaki.htm"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=("http://www.geocities.jp/littlimi/arc/misaki/misaki_ttf_2012-06-03.zip" "LICENSE")
md5sums=('86c7ab0e369e500a4725a731b491a153' 'e31e102c2b6be054412a7b5b55e438d6')

package() {
  cd ${srcdir}/

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt
}
