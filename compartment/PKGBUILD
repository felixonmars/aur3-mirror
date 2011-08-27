# Contributor: Gergely Tamas <dice@mfa.kfki.hu>
pkgname=compartment
pkgver=1.2
pkgrel=1
pkgdesc="Secure Compartment"
url="http://www.chronox.de/"
license="GPL"
depends=('glibc')
source=(http://www.chronox.de/chroot/compartment-$pkgver.tar.bz2 Makefile.diff compartment.c.diff)
md5sums=('2df15081f6475e6331cdd813f9d0918c' 'c310528ce6dda27a65928907d6250586'\
         'b495c57060a2180592b4233df153f648')

build() {
  cd $startdir/src/$pkgname
  patch -p1 < $startdir/src/Makefile.diff
  patch -p1 < $startdir/src/compartment.c.diff
  make || return 1
  make DESTDIR=$startdir/pkg install
}
