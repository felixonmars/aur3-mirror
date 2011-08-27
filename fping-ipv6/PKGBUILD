pkgname=fping-ipv6
pkgver=2.4b2
pkgrel=1
pkgdesc="A utility to ping multiple hosts at once - with IPv6 support (Debian patch)"
arch=('i686' 'x86_64')
url="http://www.fping.com/"
license=('custom') 
depends=('glibc')
provides=('fping')
conflicts=('fping')
source=(http://ftp.de.debian.org/debian/pool/main/f/fping/fping_2.4b2-to-ipv6.orig.tar.gz http://ftp.de.debian.org/debian/pool/main/f/fping/fping_2.4b2-to-ipv6-16.1.diff.gz)
md5sums=('3ad516765514249a40d3c5b6caab812a'
         '961f312a971f5c3d08a7651e63f4e1ce')

build() {
  cd $srcdir/fping-2.4b2_to-ipv6

  patch -i $srcdir/fping_2.4b2-to-ipv6-16.1.diff

  ./configure --prefix=/usr \
              --mandir=/usr/share/man || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/LICENSE" || return 1
  chmod 4755 ${pkgdir}/usr/sbin/fping
}
