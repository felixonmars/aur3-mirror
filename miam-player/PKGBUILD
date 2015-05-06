# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=miam-player
pkgver=0.7.2
pkgrel=1
pkgdesc="Cross-platform open source music player built with Qt5, VLC and Taglib."
arch=('i686' 'x86_64')
url="http://www.miam-player.org/"
license=('GPL3')
depends=('libvlc-qt' 'qt5-multimedia')
source=($pkgname-$pkgver.tar.gz::https://github.com/MBach/Miam-Player/archive/v$pkgver.tar.gz
        $pkgname.desktop)
md5sums=('bdf12e88929056ece19fb739c6029a58'
         '7e4d5016d7d0610a9126bc528d4dd757')

prepare() {
  cd $srcdir/Miam-Player-$pkgver/code  
  qmake-qt5
}

build() {
  cd $srcdir/Miam-Player-$pkgver/code
  make       
}

package() {
  cd $srcdir/Miam-Player-$pkgver/code
  make INSTALL_ROOT=$pkgdir install

  # Desktop icon
  cd $srcdir
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  cd Miam-Player-$pkgver/packaging/debian/miam-player/usr/share/icons/hicolor/64x64/apps
  install -Dm644 application-x-miamplayer.png $pkgdir/usr/share/pixmaps/$pkgname.png
}