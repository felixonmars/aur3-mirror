# Contributor: orux
pkgname=ttf-charis
pkgver=4.114
pkgrel=1
pkgdesc="Charis is similar to Bitstream Charter, one of the first fonts designed specifically for laser printers."
arch=('any')
url="http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&item_id=CharisSILfont"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('ttf-sil-fonts')
install=charis.install
source=("http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=CharisSIL-$pkgver.zip&filename=CharisSIL-$pkgver.zip")
md5sums=('ed1bb764abd0934583ffabddd67e450e')
sha256sum=('92ea75512a0bee4d491ba23fb295fd410707f6e8dedacd1af81e222a3081dd56')

package() {
  cd $srcdir/CharisSIL-$pkgver
  install -D -m644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/OFL
  mkdir -p ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
}
