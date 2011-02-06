# Maintainer: TDY <tdy@gmx.com>

pkgname=jlogtailer
pkgver=2.0.0
pkgrel=1
pkgdesc="A small Java client for monitoring log files in real time"
arch=('i686' 'x86_64')
url="http://www.jibble.org/jlogtailer.php"
license=('GPL')
depends=('java-runtime>=6')
source=(http://www.jibble.org/files/JLogTailer.jar $pkgname.launcher)
noextract=(JLogTailer.jar)
md5sums=('656df950cf22f7fcb7ce8e2b731c5fd0'
         '958263d2f0c613cc54d20f4c81ec4387')

build() {
  cd "$srcdir"
  install -Dm644 JLogTailer.jar "$pkgdir/usr/share/java/$pkgname/JLogTailer.jar"
  install -Dm755 $pkgname.launcher "$pkgdir/usr/bin/$pkgname"
}
