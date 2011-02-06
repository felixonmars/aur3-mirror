
# Contributor: imagelife <lovelinux229@gmail.com>
pkgname=zlevoclient
pkgver=0.8
pkgrel=1
pkgdesc="lenovo 802.1x supplicant for linux"
arch=('i686' 'x86_64')
url="http://code.google.com/p/zlevoclient/"
license=('MIT')
depends=('libpcap')
source=(http://zlevoclient.googlecode.com/files/$pkgname-$pkgver-src.tar.gz)
md5sums=('75fa6e7ceddc58ffbed9086dcfec77a1')

build() {
  cd "$srcdir/${pkgname}"

  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/doc/zlevoclient

  make || return 1

  install -D -m755 zlevoclient "$pkgdir/usr/bin"
  install -D -m755 zlevo_run.sh "$pkgdir/usr/bin"
  install -D -m644 Readme.txt  "$pkgdir/usr/share/doc/zlevoclient"

}
