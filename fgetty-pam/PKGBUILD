# Maintainer: Nick Erdmann <erdmann@date.upb.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>, Alois Belaska <lloyd@centrum.cz>

pkgname=fgetty-pam
pkgver=0.7
pkgrel=4
pkgdesc="A mingetty stripped of the printfs, patched for PAM-support."
arch=('i686' 'x86_64')
url='http://www.fefe.de/fgetty/'
license=('GPL')
depends=('pam')
provides=('fgetty')
conflicts=('fgetty')
makedepends=('dietlibc')
options=(!strip)
source=("http://www.fefe.de/fgetty/fgetty-$pkgver.tar.bz2"
        "fgetty-$pkgver-pam.patch")
md5sums=('1ecb286ffe3a87ef160eefc38e9038a5'
         'c2c8b05be6233caddc37652fd81e41a4')

build() {
  export PATH=$PATH:/opt/diet/bin
  cd ${srcdir}
  patch -p0 -i fgetty-${pkgver}-pam.patch
  cd fgetty-${pkgver}
  make
}
package() {
  cd ${srcdir}/fgetty-${pkgver}
  make DESTDIR=${pkgdir} install
  elftrunc $pkgdir/bin/login1 $pkgdir/bin/login1
  elftrunc $pkgdir/bin/login2 $pkgdir/bin/login2
  elftrunc $pkgdir/sbin/fgetty $pkgdir/sbin/fgetty
  mkdir -p $pkgdir/usr/share/
  mv $pkgdir/usr/man $pkgdir/usr/share/
}
