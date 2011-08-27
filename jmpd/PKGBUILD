# Maintainer: TDY <tdy@gmx.com>

pkgname=jmpd
pkgver=0.1.2
pkgrel=1
pkgdesc="A simple Java client for MPD"
arch=('any')
url="http://en.tom000.info/portfolio/jmpd_-_mpd_client.html"
license=('GPL3')
depends=('java-runtime')
source=(http://tom000.info/share/jmpd/jmpd-$pkgver.tar.bz2
        jmpd.desktop)
md5sums=('a8184c50b0a037d620f7271a17f5c44a'
         '05bebf544166be3771001cd985c7735d')

build() {
  cd "$srcdir/jMPD"
  sed -i 's#opt/jMPD#usr/share/java/jmpd#; s#$# &> /tmp/jmpd.log#' jMPD
  install -Dm755 jMPD "$pkgdir/usr/share/jmpd/jMPD"
  install -Dm644 jMPD.jar "$pkgdir/usr/share/java/jmpd/jMPD.jar"
  install -Dm644 lib/AbsoluteLayout.jar \
    "$pkgdir/usr/share/java/jmpd/lib/AbsoluteLayout.jar"
  install -Dm644 jMPD.png "$pkgdir/usr/share/pixmaps/jmpd.png"
  install -Dm644 ../jmpd.desktop "$pkgdir/usr/share/applications/jmpd.desktop"
  install -dm755 "$pkgdir/usr/bin"
  ln -sf /usr/share/jmpd/jMPD "$pkgdir/usr/bin/jmpd"
}
