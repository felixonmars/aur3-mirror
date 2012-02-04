# Maintainer: Vojtech Aschenbrenner <vojtech@aschenbrenner.cz>

pkgname=vok-asch
pkgver=1.0
pkgrel=1
pkgdesc="Vogo's Keyboard for Xorg 7 (Czech) -- asch version"
arch=('i686' 'x86_64')
url="http://www.abclinuxu.cz/blog/origami/2006/12/21/162644"
license="custom"
depends=('grep' 'qizxopen' 'perl')
install='vok.install'
source=("http://asch.cz/${pkgname}-${pkgver}.tar.bz2")
md5sums=('704da092fcb1cb4accdad06b0e5b9993')

build() {
cd $startdir/src
mkdir -p $startdir/pkg/usr/share/X11/xkb/symbols/
cp vok $startdir/pkg/usr/share/X11/xkb/symbols/
}
