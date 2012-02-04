# Contributor: IpDataTel, Inc. <matt@ipdatatel.com>

pkgname=gabriel
pkgver=0.1
pkgrel=2
pkgdesc="Gabriel is a simple client-server software that allows applications to create remote D-Bus connections over SSH."
arch=(i686 x86_64)
url="http://gabriel.sourceforge.net/"
license="GPL2"
depends=('libssh' 'glib2' 'socat' 'dbus')
source=(http://downloads.sourceforge.net/gabriel/gabriel-$pkgver.tar.gz
        gabriel.patch)
md5sums=('136d971aaf4917c31bfdc25c3f713091'
         'de8428342fdcd028a99fb0d0c9601070')
build() {
  patch $startdir/src/gabriel-$pkgver/client/gabriel.c < gabriel.patch
  cd $startdir/src/gabriel-$pkgver
  LDFLAGS="" ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
}
