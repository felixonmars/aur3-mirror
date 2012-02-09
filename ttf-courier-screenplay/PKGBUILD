# Contributor: Kasper Menten <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>

pkgname=ttf-courier-screenplay
pkgver=1.0
pkgrel=1
pkgdesc="Bitstream Courier font for screenplay"
arch=('any')
url="http://www.trelby.org/download"
license=('custom:Bitstream')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
install=$pkgname.install
source=(http://www.trelby.org/files/release/font/CourierScreenplay.zip)
md5sums=('9b2943850b5c06b6018d66b06ccd2079')

build() {
  cd $srcdir/Courier\ Screenplay\ font/

  install -d -m755 "$pkgdir"/usr/share/fonts/TTF \
    "$pkgdir"/usr/share/licenses/"$pkgname" \
    "${pkgdir}/usr/share/doc/${pkgname}"

  install -m644 CourierScreenplay*.ttf \
    "$pkgdir"/usr/share/fonts/TTF/

  install -m644 License.txt \
    "$pkgdir"/usr/share/licenses/"$pkgname"

  install -m644 Install.txt \
    "${pkgdir}/usr/share/doc/${pkgname}/"
}
# vim:set ts=2 sw=2 et: