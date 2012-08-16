pkgname=ttf-prosto
pkgver=1
pkgrel=2
pkgdesc="Prosto. A simply font"
arch=('i686' 'x86_64')
url="http://jovanny.ru/free-fonts.html"
license=('SIL OFL 1.1')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unrar')
install=ttf.install
download="prosto-${pkgver}-${pkgrel}.rar"
noextract=("${download}")
source=("${download}::http://jovanny.ru/fonts/Prosto.rar")

build() {
cd $srcdir
unrar e ${download}

install -dm755 $pkgdir/usr/share/fonts/TTF
install -dm755 $pkgdir/usr/share/licenses/Prosto

install -m644 $srcdir/Prosto.ttf $pkgdir/usr/share/fonts/TTF/
install -m644 $srcdir/OFL.txt $pkgdir/usr/share/licenses/Prosto/LICENCE
}
md5sums=('e4cf5b2c6027897522e63f7b2484a2ed')
