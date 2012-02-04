# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>

pkgname=netifera
pkgver=1.0
pkgrel=1
pkgdesc="Open Source Network Security Platform"
url="http://netifera.com/"
license=('MPL')
arch=(i686)
depends=(libxtst alsa-lib unixodbc fontconfig libxp sh libxt libxrender libxi)
source=(http://netifera.com/download/netifera-$pkgver-linux.gtk.x86.zip
  http://netifera.com/imgs/file_mins/file_min.png
  $pkgname.desktop)
md5sums=('1ae04313a904d71f73c3f407f5f1cfd7' '157bfedc8c85d77e3d434b9fdd6f55f3'\
         'b2213ad166005d9dc6afa6990b174b55')
install='install.sh'

build() {
  install -d $pkgdir/opt/$pkgname $pkgdir/usr/bin/
  cp -a $startdir/src/netifera/* $pkgdir/opt/$pkgname/
  ln -s /opt/$pkgname/netifera $pkgdir/usr/bin/

  install -d $pkgdir/usr/share/applications/ $pkgdir/usr/share/pixmaps/
  install -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/file_min.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
