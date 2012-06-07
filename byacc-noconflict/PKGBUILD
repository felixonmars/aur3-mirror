# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
# Maintainer of byacc: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: ecst <elecst 4t gmail d0t com>
# Contributor: Abel Stern <abel.stern AT gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=byacc-noconflict
_pkgname=byacc
pkgver=20120526
pkgrel=1
pkgdesc="Non-conflicting version of byacc not providing bison/yacc"
arch=('i686' 'x86_64')
url="http://invisible-island.net/byacc/"
license=('custom')
depends=('glibc')
source=(ftp://invisible-island.net/$_pkgname/$_pkgname-$pkgver.tgz
        ftp://invisible-island.net/$_pkgname/$_pkgname-$pkgver.tgz.asc)
md5sums=('d8a9959f784205092762eb29426bdf23'
         'b95c103b61381c34bee7c654a1df9747')

build() {
  cd ${srcdir}/$_pkgname-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${srcdir}/$_pkgname-$pkgver
  make DESTDIR=${pkgdir} install

  # License
  sed -n "/is distributed/,/distributed freely/p" README > COPYING
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING

  # Rename
  cd ${pkgdir}/usr/bin
  mv yacc byacc
  cd ${pkgdir}/usr/share/man/man1
  mv yacc.1 byacc.1
}
