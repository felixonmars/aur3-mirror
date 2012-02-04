# Contributor: Zoltán Nagy <abesto0[at]gmail[dot]com>
pkgname=wxremind
pkgver=101
pkgrel=4
license=('GPL')
pkgdesc="A text and graphical front/back-end for Remind, a powerful calendar and alarm application"
arch=(i686 x86_64)
url="http://www.duke.edu/~dgraham/wxRemind/"
depends=('remind' 'python2>=2.4.3' 'wxpython>=2.8.0.1' 'python2-dateutil')
optdepends=('festival: spoken-message alerts')
source=(http://www.duke.edu/~dgraham/wxRemind/wxRemind-$pkgver.tgz 
        http://www.duke.edu/~dgraham/wxRemind/WXREMINDRC-LINUX)
install=wxremind.install
md5sums=('71b1ccb2a4ca62c2a104275ebbd23a2e' 
         '403aa4b151864b9ace91d0ec3f0b311c')
build() {
  cd $srcdir
  sed -i "s/env python/env python2/" wx*
  install -D wxremalert $pkgdir/usr/bin/wxremalert
  install -D wxremdata $pkgdir/usr/bin/wxremdata
  install -D wxremhints $pkgdir/usr/bin/wxremhints
  install -D wxremind $pkgdir/usr/bin/wxremind
  sed -i 's@/home/dag@YOUR_HOME_DIR@g; s@/usr/local@/usr@g' WXREMINDRC-LINUX
  install -D WXREMINDRC-LINUX $pkgdir/usr/share/wxremind/wxremindrc-sample
}
