#
#  I'am Teh Best ;)
#
pkgname=qjoypad-static
_pkgname=qjoypad
pkgver=3.4
pkgrel=1
pkgdesc="QJoyPad translates gamepad/joystick input into key strokes/mouse actions"
arch=(i686 x86_64)
url="http://qjoypad.sourceforge.net"
dependes=('qt')
conflicts=('qjoypad')
repleaces=('qjoypad')
license=('GPL')
source=(http://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver-i486-$pkgrel.tgz
        http://aur.archlinux.org/packages/qjoypad-static/qjoypad-static/qjoypad.desktop)
md5sums=('5bf0761324f3784ce634a42a5779c709'
         'e4d9a31fd6f2b8980f965d8b11f96d8a')

build() {
  cp $startdir/src/usr $startdir/pkg/ -r
  mkdir $startdir/pkg/usr/share/applications
  cp $startdir/qjoypad.desktop $startdir/pkg/usr/share/applications/
}
