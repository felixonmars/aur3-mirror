# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Geoffrey Teale <tealeg@stop-squark>
pkgname=ttf-gillius  
pkgver=1.007
pkgrel=1 
pkgdesc="Alternative font for GillSans MT"
url="http://arkandis.tuxfamily.org/openfonts.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=(fontconfig xorg-fonts-encodings xorg-font-utils)
makedepends=(unzip)
conflicts=()
replaces=()
backup=()
install=ttf-gillius.install
source=(http://arkandis.tuxfamily.org/fonts/Gillius.zip)
md5sums=('e63dab2be498acad84704b13f4ac38eb')
build() {
  cd "$srcdir"/Gillius/TTF || return 1
  install -d -m755 "$pkgdir"/usr/share/fonts/TTF || return 1
  install -m 644 GilliusADF-Bold.ttf \
    "$pkgdir"/usr/share/fonts/TTF/GilliusADF-Bold.ttf || return 1
  install -m 644 GilliusADF-BoldItalic.ttf \
    "$pkgdir"/usr/share/fonts/TTF/GilliusADF-BoldItalic.ttf || return 1
  install -m 644 GilliusADF-Italic.ttf \
    "$pkgdir"/usr/share/fonts/TTF/GilliusADF-Italic.ttf || return 1
  install -m 644 GilliusADF-Regular.ttf \
    "$pkgdir"/usr/share/fonts/TTF/GilliusADF-Regular.ttf || return 1
  install -m 644 GilliusADFCd-Bold.ttf \
    "$pkgdir"/usr/share/fonts/TTF/GilliusADFCd-Bold.ttf || return 1
  install -m 644 GilliusADFCd-BoldItalic.ttf \
    "$pkgdir"/usr/share/fonts/TTF/GilliusADFCd-BoldItalic.ttf || return 1
  install -m 644 GilliusADFCd-Italic.ttf \
    "$pkgdir"/usr/share/fonts/TTF/GilliusADFCd-Italic.ttf || return 1
  install -m 644 GilliusADFCd-Regular.ttf \
    "$pkgdir"/usr/share/fonts/TTF/GilliusADFCd-Regular.ttf || return 1
}