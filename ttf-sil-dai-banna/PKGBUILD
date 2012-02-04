# Maintainer: Wyegu <bsdazs17 at gmail dot com>
# Contributor: Juanma Hernández <juanmah@gmail.com>
pkgname=ttf-sil-dai-banna
pkgver=2.200
pkgrel=1
pkgdesc="Dai Banna SIL Fonts. New Tai Lue (Xishuangbanna Dai) script"
url="http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&item_id=DaiBannaSIL"
arch=('any')
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=('http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=DaiBanna-2.200.zip&filename=DaiBanna-2.200.zip')
md5sums=('b6501ebc574d25d687bc9f0ac5a38a30')

build() {
  # Font installation
  install -d ${pkgdir}/usr/share/fonts/TTF
  cd ${srcdir}/dai-banna-2.200
  install -m 644 *.ttf ${pkgdir}/usr/share/fonts/TTF
  # license
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 644 ${srcdir}/dai-banna-2.200/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/ofl.txt
  install -m 644 ${srcdir}/dai-banna-2.200/doc/OFL-FAQ.txt ${pkgdir}/usr/share/licenses/${pkgname}/ofl-faq.txt
}
