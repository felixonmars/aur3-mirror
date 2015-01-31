# Maintainer: Natalia Portillo <claunia@claunia.com>
# Contributor: Mladen Pejaković <pejakm@gmail.com>
# Maintainer: Ray Kohler <ataraxia937@gmail.com>
# Category: system

pkgname=vilefault
pkgver=r23
pkgrel=1
pkgdesc="Tools for encrypted Apple DMGs (vfcrack and vfdecrypt)"
url="https://code.google.com/p/vilefault/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('openssl')
source=(vilefault::svn+http://vilefault.googlecode.com/svn/trunk
        inttypes.patch)
md5sums=('SKIP'
         'd7c060d5f3483cb854c8d873a40f0d97')

pkgver() {
  cd $startdir/src/$pkgname/$pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd $startdir/src/$pkgname/vfcrack || return 1
  make || return 1

  cd $startdir/src/$pkgname/vfdecrypt || return 1
  patch < $startdir/inttypes.patch || return 1
  gcc -Wall -O2 -funroll-loops -I. -I../vfcrack -lssl -lcrypto -o vfdecrypt *.c || return 1
}

package() {
  cd $startdir/src/$pkgname/vfcrack || return 1
  install -D -s -m 755 vfcrack $startdir/pkg/usr/bin/vfcrack || return 1
  install -D -m 644 vfcrack.1 $startdir/pkg/usr/share/man/man1/vfcrack.1 || return 1

  cd $startdir/src/$pkgname/vfdecrypt || return 1
  install -D -s -m 755 vfdecrypt $startdir/pkg/usr/bin/vfdecrypt || return 1
  install -D -m 644 vfdecrypt.1 $startdir/pkg/usr/share/man/man1/vfdecrypt.1 || return 1
}
