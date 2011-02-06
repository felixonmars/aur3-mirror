# Contributor: Dirk Sohler <spam@0x7be.de>               
# Maintainer: Dirk Sohler <spam@0x7be.de>

pkgname=droidpad-server
pkgver=0
pkgrel=1
pkgdesc='Server program for using DroidPad'

url='http://www.droidpad.es/'
arch=('i686' 'x86_64')
license=('unknown')
depends=('java-runtime')
conflicts=('remotedroid-server')

install=droidpad-server.install
md5sums=('111ecf1fb301e3e9ef61ed2d226e4449' '057f510208da76cafe017681e765ced7')
source=('http://www.droidpad.es/droidpad-server.zip' 'MPlayer')

build() {
  cd $srcdir/$pkgname/
  mkdir -p $pkgdir/opt/$pkgname/Config/{Music,Presentation,Video}
  install -D droidpad-server.jar $pkgdir/opt/$pkgname/
  install -D Config/{Config,Preferencias} $pkgdir/opt/$pkgname/Config/
  install -D Config/Music/* $pkgdir/opt/$pkgname/Config/Music/
  install -D Config/Presentation/* $pkgdir/opt/$pkgname/Config/Presentation/
  install -D Config/Video/* $pkgdir/opt/$pkgname/Config/Video/
  # MPlayer (default configuration) controls for video. For next/previous the
  # shortcuts for skipping +/- 10 seconds are used.
  install -D $srcdir/MPlayer $pkgdir/opt/$pkgname/Config/Video/
}
