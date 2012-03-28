# Packager: Alexander Frolushkin <hokum_at_mail.ru>

pkgname=bin32-multifon-bin
pkgver=2.0
pkgrel=3
pkgdesc="SIP-based Video/VoIP client made by russian telecommunication company - Megafon"
url="http://www.multifon.ru"
license=('custom')
arch=('x86_64')
source=(http://www.multifon.ru/media/download/files/multifon_2.0_linux.deb)
depends=('lib32-sqlite3' 'lib32-libjpeg6' 'lib32-libxss' 'lib32-libaudio2' 'lib32-libpng12')
provides=('multifon')
conflicts=('bin32-multifon-bin' 'megafon-multifon' 'multifon-bin')
sha256sums=('98f871bad9154b6b9f845d3494bc24980e3663d57fbb452e2c628c0f4bce1fa4')

build() {
cd $startdir/src/
    rm control.tar.gz
    rm debian-binary
  tar xf *.tar.gz
install -m 644 -D ${startdir}/src/etc/xdg/menus/applications-merged/megafon-multifon.menu $startdir/pkg/etc/xdg/menus/applications-merged/megafon-multifon.menu
cp -r ${startdir}/src/usr ${startdir}/pkg/usr
        }
