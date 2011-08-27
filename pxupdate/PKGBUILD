# Contributor: Pulphix <pulphix@crazysource.org>

pkgname=pxupdate
pkgver=1.39
pkgrel=1
pkgdesc="Plextor Firmware Update program"
url="ftp://ftp.berlios.de/pub/cdrecord/firmware/plextor/"
license=""
depends=()
source=(ftp://ftp.berlios.de/pub/cdrecord/firmware/plextor/$pkgname-$pkgver-i686-pc-linux-gnu )
md5sums=('9b315257613fd5007045f6a4e7d72516')


build() {
  cd $startdir/src/
  install -D -m744 $pkgname-$pkgver-i686-pc-linux-gnu $startdir/pkg/usr/sbin/pxupdate
}
