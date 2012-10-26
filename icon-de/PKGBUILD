# Maintainer: phoenixlzx <phoenixlzx at archlinuxcn dot org>
# Author: ljj_jjl2008 
pkgname=icon-de
pkgver=2.1.0
pkgrel=2
pkgdesc="A new desktop environment featuring icons and window manager emulators"
arch=("i686" "x86_64")
url="http://forum.ubuntu.org.cn/viewtopic.php?f=1&t=372366"
license=('GPL')
depends=('libx11' 'libxmu' 'glib2' 'libxcomposite' 'libxfixes' 'libxdamage' 'libxrender' 'libxinerama' 'libxft' 'imlib2' 'wqy-zenhei' 'xorg-server-xephyr')
install='./icon-de.install'
source=($pkgname-$pkgver.tar.gz::http://ftp.archlinuxcn.org/icon-de_2.1.0_source.tar.gz)
sha1sums=('71b3395724db48d75a22eba64f29bcff46a47984')

build() {
  cd "$srcdir"
  make
}


package() {
  cd "$srcdir"
  make install -e INSTDIR=$pkgdir/
}
