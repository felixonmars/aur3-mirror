#Autor: Alexandre Minoshi(Almin-Soft Group)
#Maintainer: Alexandre Minoshi

pkgname=xelplayer
pkgver=15
pkgrel=8
pkgdesc="GUI for Mplayer. Depends neither GTK nor Qt, only X11"
options=('!strip')
arch=('i686' 'x86_64')
url="http://almin-soft.ru/index.php?multimedia-programmy/xelplayer/tags/xelplayer"
license=('GPL2')
if [ "${CARCH}" = 'x86_64' ]; then
depends=('mplayer' 'lib32-libx11' 'lib32-libxrender' 'lib32-gcc-libs')
elif [ "${CARCH}" = 'i686' ]; then
depends=('mplayer' 'libx11' 'gcc-libs' 'libxrender')
fi
optdepends=('lib32-libxft: antialiased problem fix for x64')
source=("xelplayer.tar.bz2::http://almin-soft.ru/data/files/xelplayer15/download.php?get=xelplayer.tar.bz2")

package() {
  install -d $pkgdir/opt/xelplayer
  cp -R $srcdir/* $pkgdir/opt/xelplayer
  chmod -R 777 $pkgdir/opt/xelplayer/*
  chmod 777 $pkgdir/opt/xelplayer
  install -Dm644 xelplayer_logo.png $pkgdir/usr/share/pixmaps/xelplayer.png
  install -Dm644 xelplayer.desktop $pkgdir/usr/share/applications/xelplayer.desktop
}
md5sums=('8cc21032df060133511ab1624aff4272')
