# Maintainer: mlq <mlq@pwmt.org>
pkgname=irssi-mouse
pkgver=0.8.15
pkgrel=1
pkgdesc="Modular text mode IRC client with Perl scripting and mouse support"
arch=(i686 x86_64)
license=('GPL')
url="http://irssi.org/"
depends=('glib2' 'openssl' 'ncurses' 'perl>=5.10.0-1')
source=(http://irssi.org/files/irssi-$pkgver.tar.bz2 http://darksun.com.pt/mirage/irssi/files/irssi_mouse_xterm-0.7-0.8.13.patch http://darksun.com.pt/mirage/irssi/files/irssi_mouse_xterm_act-0.2.patch)
md5sums=('1dcb3f511b88df94b0c996f36668c7da'
         'c9ceb46eec65f4821e27e9ed4d60834e'
          '98a052f15e9f21cf2c2895e32473f59f')
options=('!libtool')
provides=('irssi')
conflicts=('irssi')

build() {
  cd $startdir/src/irssi-$pkgver

  # Patch : Xterm Mouse
  msg "Patching... Xterm Mouse"
  patch -p1 < $startdir/irssi_mouse_xterm-0.7-0.8.13.patch

  # Patch : Xterm Act
  msg "Patching ... Xterm Act"
  patch -p1 < $startdir/irssi_mouse_xterm_act-0.2.patch

  ./configure --prefix=/usr --enable-ipv6 --with-proxy --sysconfdir=/etc \
  --with-perl-lib=vendor

  make || return 1
  make DESTDIR=$startdir/pkg install
}
