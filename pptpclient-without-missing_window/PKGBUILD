# Maintainer: hasardeur <hasardeur at lavabit dot com>
pkgname=pptpclient-without-missing_window
pkgver=1.7.2
pkgrel=3
pkgdesc="Client for the proprietary Microsoft Point-to-Point Tunneling Protocol, PPTP - patched to remove MISSING_WINDOW checks."
arch=('i686' 'x86_64')
url="http://pptpclient.sourceforge.net/"
license=('GPL')
depends=('ppp' 'iproute2')
conflicts=('pptpclient')
provides=('pptpclient')
backup=('etc/ppp/options.pptp')
source=("http://downloads.sourceforge.net/sourceforge/pptpclient/pptp-$pkgver.tar.gz" "adj_missing_window.patch")
md5sums=('4c3d19286a37459a632c7128c92a9857'
         '51081b3f898dd387c15670dd4caf1f8f')

build() {
  cd $srcdir/pptp-$pkgver

  #apply patch
  patch -p1 -i $srcdir/adj_missing_window.patch 

  # use our CFLAGS and LDFLAGS
  sed -i -e "/CFLAGS  =/ c\CFLAGS = ${CFLAGS}" Makefile
  sed -i -e "/LDFLAGS =/ c\LDFLAGS = ${LDFLAGS}" Makefile

  # adjust ip path
  sed -i 's#/bin/ip#/usr/sbin/ip#' routing.c

  make 
}

package() {
  cd $srcdir/pptp-$pkgver
  make DESTDIR=$pkgdir install
}
