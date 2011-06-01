pkgname=ttf-sil-apparatus-old
pkgver=1
pkgrel=1
pkgdesc="SIL Apparatus font; pre-Unicode system font, superseded by Unicode-encoded Apparatus SIL"
arch=('i686' 'x86_64')
url="http://scripts.sil.org/cms/scripts/page.php?item_id=SILAp_home"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=('http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=SILAPFON.EXE&filename=SILAPFON.EXE')
md5sums=('0a8f9396eb086d644710b6352c324b68')

build() {
  mkdir -p ${startdir}/pkg/usr/share/fonts/TTF 
  cd ${startdir}/src
  install -Dm644 ${startdir}/src/SILAPFON/SILAB.TTF ${startdir}/pkg/usr/share/fonts/TTF/SILAB.ttf
  install -Dm644 ${startdir}/src/SILAPFON/SILABI.TTF ${startdir}/pkg/usr/share/fonts/TTF/SILABI.ttf
  install -Dm644 ${startdir}/src/SILAPFON/SILAI.TTF ${startdir}/pkg/usr/share/fonts/TTF/SILAI.ttf
  install -Dm644 ${startdir}/src/SILAPFON/SILAR.TTF ${startdir}/pkg/usr/share/fonts/TTF/SILAR.ttf
  install -Dm644 ${startdir}/src/SILAPFON/AppGuide.pdf ${startdir}/pkg/usr/share/doc/$pkgname/AppGuide.pdf
  install -Dm644 ${startdir}/src/SILAPFON/README.TXT ${startdir}/pkg/usr/share/doc/$pkgname/README.TXT
  install -Dm644 ${startdir}/src/SILAPFON/RELNOTES.TXT ${startdir}/pkg/usr/share/doc/$pkgname/RELNOTES.TXT
}
