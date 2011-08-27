# edited by Li Shun <riverscn@gmail.com>

pkgname=jpcap
pkgver=0.7
pkgrel=3
pkgdesc="Jpcap is a Java library for capturing and sending network packets."
arch=('i686')
url="http://netresearch.ics.uci.edu/kfujii/jpcap/doc/index.html"
license=('GPL')
depends=('libcap' 'jre')
makedepends=('jdk')
source=(http://netresearch.ics.uci.edu/kfujii/jpcap/jpcap-0.7.tar.gz)
md5sums=('faa3c4be407ce3419cad90150db391a5')

build() {
  cd "$srcdir/jpcap-0.7/src/c" || return 1
  make || return 1

  mkdir -p "$pkgdir/opt/java/jre/lib/i386" || return 1
  cp libjpcap.so "$pkgdir/opt/java/jre/lib/i386" || return 1

  mkdir -p "$pkgdir/opt/java/jre/lib/ext" || return 1
  cp "$srcdir/jpcap-0.7/lib/jpcap.jar" "$pkgdir/opt/java/jre/lib/ext" || return 1
}

