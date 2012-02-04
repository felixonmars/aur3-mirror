# Maintainer: Jonathan Vasquez <jvasquez1011 at gmail dot com>

pkgname=pvpgn-server
pkgver=1.8.5
pkgrel=1
pkgdesc="A bnetd based gaming network server emulation project"
arch=('i686' 'x86_64')
url="http://pvpgn.berlios.de/"
license=('GPL')
#depends=('mysql') #Uncomment for MySQL support
#depends=('postgresql') #Uncomment for PostgreSQL support
conflicts=('pvpgn')
changelog=
source=(http://download.berlios.de/pvpgn/pvpgn-$pkgver.tar.bz2)
md5sums=('0a8353c26f8af0272208664a3ce0f830')

build() {
  cd "$srcdir/pvpgn-$pkgver/src"

  # Without MySQL Support
  ./configure \
    --prefix=$pkgdir/usr \
    --sysconfdir=$pkgdir/etc/pvpgn \
    --localstatedir=$pkgdir/var/lib/pvpgn \
    --mandir=$pkgdir/usr/share/man

  # With MySQL Support
  #./configure \
    #--prefix=$pkgdir/usr \
    #--sysconfdir=$pkgdir/etc/pvpgn \
    #--localstatedir=$pkgdir/var/lib/pvpgn \
    #--mandir=$pkgdir/usr/share/man \
    #--with-mysql

  # With PostgreSQL Support
  #./configure \
    #--prefix=$pkgdir/usr \
    #--sysconfdir=$pkgdir/etc/pvpgn \
    #--localstatedir=$pkgdir/var/lib/pvpgn \
    #--mandir=$pkgdir/usr/share/man \
    #--with-pgsql

  make
}

package() {
  cd "$srcdir/pvpgn-$pkgver/src"

  install -D -m644 ../COPYING "$pkgdir/usr/share/licenses/pvpgn-$pkgver/COPYING"

  make prefix="$pkgdir/usr" install
}
