# Contributor : Vladimir Navrat <vn158 at seznam dot cz> & ap_Codkelden

pkgname=ttf-antykwa-torunska
pkgver=2.08
pkgrel=2
pkgdesc="TrueType font Antiqua of Torun by Zygfryd Gardzielewski (1914–2001)."
arch=(i686 x86_64)
license=('custom:GUST')
url="http://jmn.pl/en/antykwa-torunska/"
install=ttf.install
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
makedepends=(unzip)
source=("http://nowacki.strefa.pl/pliki/AntykwaTorunska-ttf-2_08.zip" "LICENSE")
_zipname="AntykwaTorunska-ttf-2_08.zip"
noextract=("$_zipname")
md5sums=('655c0b7603638e137eac548ac204909f'
         '7ab98aedba83bca3de4a3ca3792e7390')
package() {
  fonts="AntykwaTorunska-Bold.ttf AntykwaTorunska-BoldItalic.ttf AntykwaTorunska-Italic.ttf AntykwaTorunska-Regular.ttf AntykwaTorunskaCond-Bold.ttf AntykwaTorunskaCond-BoldItalic.ttf AntykwaTorunskaCond-Italic.ttf AntykwaTorunskaCond-Regular.ttf AntykwaTorunskaCondLight-Italic.ttf AntykwaTorunskaCondLight-Regular.ttf AntykwaTorunskaCondMed-Italic.ttf AntykwaTorunskaCondMed-Regular.ttf AntykwaTorunskaLight-Italic.ttf AntykwaTorunskaLight-Regular.ttf AntykwaTorunskaMed-Italic.ttf AntykwaTorunskaMed-Regular.ttf"
  unzip -j $_zipname
  for font in $fonts; do
   install -Dm644 $font "$pkgdir"/usr/share/fonts/TTF/$font
  done
  install -D -m644 $startdir/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
