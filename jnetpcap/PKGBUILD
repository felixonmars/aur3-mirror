# edited by goten002 <goten002@gmail.com>

pkgname=jnetpcap
pkgver=1.4.r1300
pkgrel=1
pkgdesc="jNetPcap is a Java library for capturing and sending network packets."
arch=('any')
url="http://jnetpcap.com/"
license=('LGPL')
depends=('libpcap' 'java-runtime')
makedepends=('java-environment')
if [ $CARCH="i686" ]; then
arch=('i686')
source=(http://sourceforge.net/projects/jnetpcap/files/jnetpcap/1.4/jnetpcap-${pkgver}-1.linux.i386.tgz/download)
md5sums=('1e4e706354602f0ee8e6aa6ce50be8d6')
else
arch=('x86_64')
source=(http://sourceforge.net/projects/jnetpcap/files/jnetpcap/1.4/jnetpcap-${pkgver}-1.linux.x86_64.tgz/download)
md5sums=('ae563fa3108b6d2586fd318e5ea22dff')
fi
build() {
  cd "$srcdir/jnetpcap-$pkgver"
  mkdir -p "$pkgdir/usr/lib/"
  cp libjnetpcap.so "$pkgdir/usr/lib/"
  cp libjnetpcap-pcap100.so "$pkgdir/usr/lib/"
  mkdir -p "$pkgdir/usr/share/java/"
  cp jnetpcap.jar "$pkgdir/usr/share/java/"
  cd include
  mkdir -p "$pkgdir/usr/include/"
  cp * "$pkgdir/usr/include/"
}