# Contributor: pfm <vorticity@mail.ru>

pkgname=tx
pkgver=1.2
pkgrel=4
pkgdesc="Qt4 based tabular XML editor"
arch=('i686' 'x86_64')
url="http://www.gravitybind.com/"
license=('GPL2')
depends=('qt4')
replaces=('teddy')
provides=('teddy')
source=("http://www.gravitybind.com/download/${pkgname}_1-2_src.zip" \
        "tx.desktop")
md5sums=('5d40113430e7dcb72a490e9644f11561'
         'feb9b0f064e4a6c79a6523e4232fdc85')

build() {
  cd $srcdir/$pkgname
  qmake-qt4 tx.pro
  make
}

package() {
  install -D -m 755 $srcdir/$pkgname/bin/tx \
                    $pkgdir/usr/bin/tx
  install -D -m 644 $srcdir/$pkgname/images/tX.png \
                    $pkgdir/usr/share/pixmaps/tx.png
  install -D -m 644 $srcdir/tx.desktop \
                     $pkgdir/usr/share/applications/tx.desktop
}