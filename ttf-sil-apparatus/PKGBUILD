pkgname=ttf-sil-apparatus
pkgver=1
pkgrel=1
pkgdesc="Symbols used for Biblical text apparatus from SIL"
arch=('i686' 'x86_64')
url="http://scripts.sil.org/cms/scripts/page.php?item_id=ApparatusSIL"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=('http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=AppSIL1.0.zip&filename=ApparatusSIL.zip')
md5sums=('dc731cbca134eb554b9ad2bba0bef143')

build() {
  mkdir -p ${startdir}/pkg/usr/share/fonts/TTF 
  cd ${startdir}/src
  install -Dm644 ${startdir}/src/Apparatus\ SIL/AppSILBI.TTF ${startdir}/pkg/usr/share/fonts/TTF/AppSILBI.ttf
  install -Dm644 ${startdir}/src/Apparatus\ SIL/AppSILB.TTF ${startdir}/pkg/usr/share/fonts/TTF/AppSILB.ttf
  install -Dm644 ${startdir}/src/Apparatus\ SIL/AppSILI.TTF ${startdir}/pkg/usr/share/fonts/TTF/AppSILI.ttf
  install -Dm644 ${startdir}/src/Apparatus\ SIL/AppSILR.ttf ${startdir}/pkg/usr/share/fonts/TTF/AppSILR.ttf
  # license...
  install -Dm644 ${startdir}/src/Apparatus\ SIL/OFL-FAQ.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/ofl-faq.txt
  install -Dm644 ${startdir}/src/Apparatus\ SIL/OFL.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/ofl.txt
}
