# Maintainer: BxS <bxsbxs at gmail dot com>

pkgname=microchip-mplabxc16-bin
pkgver=1.10
pkgrel=2
pkgdesc="C compiler for PIC24 MCUs and dsPIC DSCs"
arch=(i686 x86_64)
url=http://www.microchip.com/xc16
license=(custom)
[ $CARCH = x86_64 ] && depends=(lib32-gcc-libs)
makedepends=(xclm-dirs)
provides=(mplabxc16)
conflicts=(mplabxc16)
options=(!strip docs libtool emptydirs !zipman)
install=$pkgname.install
instdir=/opt/microchip/xc16/v$pkgver
installer=xc16-v$pkgver-linux.run
source=(http://ww1.microchip.com/downloads/en/DeviceDoc/xc16-v$pkgver-linux.tar)
md5sums=(fa53ffc88b657bf181eeed0ab6b7691a)

package() {
  echo -e "Creating the Package\n  Please wait..."

  cd $pkgdir

  mkdir -p $pkgdir$instdir

  chmod 0755 $srcdir/$installer
  echo -e "i\n\n\n\n\n\n\n\n\n\n\n\n\n\ny\n\n\n\ny\n\n$pkgdir$instdir\ny\ni\ni\ni\ni" > inst_input
  mkdir -p $pkgdir/home
  HOME=$pkgdir/home $srcdir/$installer --mode text < inst_input &> /dev/null
  rm inst_input
  rm -r $pkgdir/home

  rm -r $pkgdir$instdir/{Uninstall*,bin/{roam.lic,xclm},etc,rollbackBackupDirectory} || true

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  ln -s $instdir/MPLAB_XC16_Compiler_License.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
