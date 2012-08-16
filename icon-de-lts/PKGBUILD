# Maintainer: 
# Author: ljj_jjl2008 
pkgname=icon-de-lts
pkgver=1.2.7
pkgrel=1
pkgdesc="A new desktop environment featuring icons and window manager emulators"
arch=("i686" "x86_64")
url="http://forum.ubuntu.org.cn/viewtopic.php?f=1&t=372366"
license=('GPL')
conflicts=('icon-de')
depends=('libx11' 'libxmu' 'glib2' 'libxcomposite' 'libxfixes' 'libxdamage' 'libxrender' 'libxinerama' 'libxft' 'imlib2' 'wqy-zenhei' 'xorg-server-xephyr')
install='./icon-de.install'
source=($pkgname-$pkgver.tar.gz::http://ftp.archlinuxcn.org/icon-de_1.2.7_source.tar.gz)
sha1sums=('375c0758e1afe6bf7f518ef20c960a57d02d1cad')


build() {
  cd "$srcdir"
  make
}


package() {
  cd "$srcdir"
  make install -e INSTDIR=$pkgdir/
}
