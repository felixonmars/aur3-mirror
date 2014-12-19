# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=ypjoy
pkgver=0.9.4
pkgrel=1
pkgdesc="Fast, safe and ad-free YouPorn video browser and downloader."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ypjoy/"
license=('GPL3')
depends=('qtwebkit')
optdepends=('mplayer: Use MPlayer as playback'
            'smplayer: Use SMPlayer as playback'
            'vlc: Use VLC as playback'
            'xine-ui: Use Xine as playback'
            'totem: Use Totem as playback'
            'kdemultimedia-dragonplayer: Use Dragon Player as playback')
install=$pkgname.install
source=(http://sourceforge.net/projects/ypjoy/files/ypjoy-$pkgver.tar.gz)
md5sums=('c7d50fdf4c9c4e0cfefb10b3c98cf11f')

prepare() {
  cd $srcdir/$pkgname

  # Fix 'sleep' function for GCC>4.7
  sed -i '19i #include <unistd.h>' ypsite.cpp

  qmake-qt4
}

build() {
  cd $srcdir/$pkgname
  make
}

package() {
  cd $srcdir/$pkgname
  make INSTALL_ROOT=$pkgdir install
}