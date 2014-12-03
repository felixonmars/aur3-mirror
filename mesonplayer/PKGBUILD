# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=mesonplayer
pkgver=0.6
pkgrel=1
pkgdesc="Tray icon music player."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mesonplayer/"
license=('GPL3')
depends=('libbass' 'libbassmix' 'qt5-base' 'quazip')
install=$pkgname.install
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/v$pkgver/$pkgname-v$pkgver-src.7z
        play.ico
        stop.ico
        pause.ico
        $pkgname.desktop
        $pkgname.sh)
md5sums=('572dca497701ec2204f43064668791a1' 'fa126c478d229ee295c80d7f2f334b1b' '5ecc8ad0f87e0df5fe05c3aa0e3b0655' \
         '85bfff2c330d31d41a004c0812f41d8f' '58b23a1456766eabae1cf13adb8ba1c9' '8a5c0c0d906906ecf35d0856a65483bd')

prepare() {
  cd $srcdir/$pkgname/inc/mesonsoundengine

  # Fix path 'bass.h' and 'bassmix.h'
  sed -i 's|bass/bass.h|bass.h|' mse_types.h
  sed -i 's|bass/bassmix.h|bassmix.h|' sources/mse_source_url.h

  cd $srcdir/$pkgname/$pkgname
  qmake-qt5       
}

build() {
  cd $srcdir/$pkgname/$pkgname
  make       
}

package() {

  cd $startdir

  # Create directories
  mkdir -p $pkgdir/usr/share/$pkgname/{icons,plugins}

  # Icons
  cp -r *.ico $pkgdir/usr/share/$pkgname/icons

  cd $srcdir/$pkgname/$pkgname

  # Binary
  install -Dm755 $pkgname $pkgdir/usr/share/$pkgname/$pkgname

  # Launcher
  install -Dm755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname

  # Desktop file
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 icon.ico $pkgdir/usr/share/pixmaps/$pkgname.ico

  # Manual
  cp -r manual/ $pkgdir/usr/share/$pkgname
}