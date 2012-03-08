# Maintainer: AlexanderR <rvacheva at nxt dot ru>
# http://mirrormoon.org/news/2007-01-15-tsukihime_english_for_linux_and_osx
pkgname=tsukihime-en
pkgver=1.1
pkgrel=1
pkgdesc="A Japanese eroge dojin visual novel game that tells story of Shiki Tohno, a second year high school student, who suffered a life-threatening injury when he was young. English translation by Mirror Moon. Requires original disk."
arch=('any')
url="http://mirrormoon.org/projects/tsukihime"
license=('custom: commercial')
depends=('onscripter-en' 'ttf-sazanami')
makedepends=('p7zip' 'icoutils')
options=(!strip !zipman)
install=${pkgname}.install
source=("http://m.mirrormoon.org/get/8/tsukihime_english_v1.1%5Bmirror_moon%5D.exe"
	"http://m.mirrormoon.org/get/7/Tsukihime_English_v1.2_update_%5bmirror_moon%5d.exe"
	"${pkgname}.desktop"
	"${pkgname}.sh"
	'install.sh')

build() {
  cd "$srcdir"
  7z e tsukihime_english_v1.1%5Bmirror_moon%5D.exe -y -i\!arc.nsa -i\!tsukihime.ico \
	-i\!nscript.dat
  7z e Tsukihime_English_v1.2_update_%5bmirror_moon%5d.exe -y -i\!arc1.nsa -i\!*.txt \
	-i\!Flowchart.pdf
  icotool -x tsukihime.ico -o icon.png
  sed -n '/This English/,/  thereof/p' Readme.txt > LICENSE
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/"{$pkgname,doc/$pkgname}
  install -m644 {arc.nsa,arc1.nsa,nscript.dat,icon.png} "$pkgdir/usr/share/$pkgname"
  install -m644 {*.txt,Flowchart.pdf} "$pkgdir/usr/share/doc/$pkgname"
  install -m755 install.sh "$pkgdir/usr/share/$pkgname/install.sh"
  install -D -m755 ${pkgname}.sh "$pkgdir/usr/bin/$pkgname"
  install -D -m644 ${pkgname}.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -D -m644 tsukihime.ico "$pkgdir/usr/share/pixmaps/${pkgname}.ico"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('3d0b65d6f43ac469b05fece3b0eb2dda'
         'd311aa87b8356b2371348a406929f862'
         '740f5c20252a3dc3a1499f375ca75013'
         '5cdaad00141c0d7e6401cb3673440143'
         'de2222fa473a1f1b33172d33c01b271b')
