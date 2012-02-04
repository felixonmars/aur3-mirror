# Contributor: David Brown <davidb AT davidb DOT org>

pkgname=aegis
pkgver=4.24.2
pkgrel=3
pkgdesc="A transaction-based software configuration management system"
arch=('i686' 'x86_64')
url="http://aegis.sourceforge.net/"
license=('GPL')
depends=('zlib' 'bzip2' 'libxml2' 'curl' 'file' 'openssl')
makedepends=()
optdepends=()
source=(http://downloads.sourceforge.net/sourceforge/aegis/aegis-$pkgver.tar.gz
   0001-Workaround-for-memchr-const-problem.patch
   aegis-stable-fix-aecp-ind.patch)
md5sums=('b313cfacc9e3fc8536f186f6b796d429'
         '4118737a6d2b0128a7ff652a4063cd8e'
         'c2a902d1662904578b98d99d19b5d2ce')

build() {
  cd $srcdir/$pkgname-$pkgver

  patch -p1 < ../0001-Workaround-for-memchr-const-problem.patch || return 1
  patch -p0 < ../aegis-stable-fix-aecp-ind.patch || return 1
  ./configure --prefix=/usr --sharedstatedir=/var/lib/aegis || return 1

  # Fix up Makefile to pass -D to install.
  sed -i 's|^INSTALL = .*install.*|& -D|' ./Makefile

  make || return 1

  make DESTDIR=$pkgdir install || return 1

  # Fix the profiles up.
  mv $pkgdir/usr/etc $pkgdir/etc
}

# vim:set sw=2 et:
