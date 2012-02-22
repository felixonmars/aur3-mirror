# Maintainer: anergy <anergy.25110321@gmail.com>
pkgname=ttf-terminaldosis
pkgver=1.6
pkgrel=1
epoch=
pkgdesc="very simple, rounded, sans serif font family"
arch=(any)
url="http://www.impallari.com/terminaldosis/"
license=('custom:OFL')
groups=()
depends=('fontconfig' 'xorg-font-utils')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=updatefont.install
changelog=
source=("http://www.impallari.com/media/releases/terminaldosis-v$pkgver.zip"
        'OFL.txt::http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=OFL_plaintext&filename=OFL.txt')
sha256sums=('d04c85d66359bc1aa3ceab04369875a3335c5230a73a9f8979ed5f222ad887d0'
            'ca122f3bda0154f692817450168cb650a7fc59ef96c93582acd2e7a744d464d3')
#build() {
#
#}

package() {
  cd $srcdir/Terminal\ Dosis\ Family\ v$pkgver
  install -d ${pkgdir}/usr/share/licenses/$pkgname
  install -m644 ../OFL.txt ${pkgdir}/usr/share/licenses/$pkgname/
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF
}

# vim:set ts=2 sw=2 et:
