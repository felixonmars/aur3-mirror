# Maintainer: AlexanderR <rvacheva at nxt dot ru>
# http://mirrormoon.org/news/2007-01-15-tsukihime_english_for_linux_and_osx
pkgname=kagetsu-tohya-en
pkgver=0.5.2
pkgrel=1
pkgdesc="TYPE-MOON's sequel to their earlier dojin visual novel game, Tsukihime."
arch=('any')
url='http://nrvnqsr.proboards20.com'
license=('custom: commercial')
depends=('onscripter-en' 'ttf-sazanami')
makedepends=('p7zip' 'icoutils')
options=(!strip !zipman)
install=${pkgname}.install
changelog=ChangeLog
source=("http://sourceforge.net/projects/fakenames.u/files/misc/Kagetsu_Tohya_English_v0.5.2_setup.exe"
	"${pkgname}.desktop"
	"${pkgname}.sh"
	'install.sh')

build() {
  cd "$srcdir"
  7z e Kagetsu_Tohya_English_v${pkgver}_setup.exe -y -i\!arc1.nsa -i\!icon.png \
	-i\!nscript.dat -i\!readme.txt -i\!bonus/Kagetsu\ Tohya\ Flowchart.pdf

  sed -n '/This patch is/,/this./p' readme.txt > LICENSE
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/"{$pkgname,doc/$pkgname}
  install -m644 {arc1.nsa,nscript.dat,icon.png} "$pkgdir/usr/share/$pkgname"
  install -m644 {*.txt,Kagetsu\ Tohya\ Flowchart.pdf} "$pkgdir/usr/share/doc/$pkgname"
  install -m755 install.sh "$pkgdir/usr/share/$pkgname/install.sh"
  install -D -m755 ${pkgname}.sh "$pkgdir/usr/bin/$pkgname"
  install -D -m644 ${pkgname}.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -D -m644 icon.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('3c7e11175c7c4e8e6388825c49378449'
         'ac06c290ac2ec3922b67c20f67c1d1d1'
         '2b08cd0164aa40881edab96661c7e4dc'
         'eac6718ebcc0d51c64dc38ab9a856051')
