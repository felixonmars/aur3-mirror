# $Id: PKGBUILD,v 1.14 2005/04/03 21:05:37 judd Exp $
# Contributor: MrGreen <mrgreen.linuxuser@gmail.com>
pkgname=op
pkgver=1.32
pkgrel=1
pkgdesc="The op tool provides a flexible means for system administrators to grant access to certain root operations."
url="https://svn.swapoff.org/op"
depends=('glibc' 'pam')
backup=('etc/op.conf')
source=(http://swapoff.org/files/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('795b0ffabd305d48288aff46542fe3bf')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --enable-xauth=/usr/bin/xauth --with-pam
  make DESTDIR=$startdir/pkg install || return 1
  mkdir -p $startdir/pkg/etc/pam.d
  install -m644 $startdir/src/${pkgname}-${pkgver}/op.pam $startdir/pkg/etc/pam.d/op
}
