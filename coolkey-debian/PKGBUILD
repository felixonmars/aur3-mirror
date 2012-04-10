# Maintainer: arch-nemesis <cory.is.evil@gmail.com>
pkgname=coolkey-debian
pkgver=1.1.0
pkgrel=11
pkgdesc="Coolkey provides PKCS11 module support for smart-card readers, taken from Debian upstream"
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/coolkey"
license=('GPL')
depends=('pcsclite' 'ccid')
makedepends=()
provides=('coolkey')
conflicts=('coolkey')
replaces=()
backup=()
options=()
install=
changelog=
source=('http://ftp.de.debian.org/debian/pool/main/c/coolkey/coolkey_1.1.0.orig.tar.gz'
        'spelling-error-in-binary'
        'coolkey-pcsc-lite'
        'coolkey-cache-dir-move.patch'
        'coolkey-gcc43.patch'
        'coolkey-latest.patch'
        'coolkey-simple-bugs.patch'
        'coolkey-thread-fix.patch'
        'coolkey-cac.patch'
        'coolkey-cac-1.patch'
        '0001-Fix-working-with-empty-certificates-in-not-zero-slot.patch')



md5sums=('815a1811a46bf9b8782107c073149cbe'
         'c27a26f020b22f250c20e60732d0315d'
         '8ae1fe1c77ab0cd097a7eb3bf224f1b7'
         '4c304ac7beeec8252b8be04920021ab4'
         '1cd06f78ef13f069063ec36b1fa42acd'
         '7747a9580033894b6337f592def3edf4'
         'a9ae02a88184f39c4c9d4833a79165d7'
         '880dfac63ad6c267e5cc3869207c1927'
         'e2462ac63672f2a8d622b1c17e53a6e7'
         '7744a4fb0cd13a593e210840df8f4d30'
         '8650bf073150c3001d886bdaf4aff862')

build() {
  cd "$srcdir/coolkey-1.1.0"
  patch -p1 < $srcdir/spelling-error-in-binary
  patch -p1 < $srcdir/coolkey-pcsc-lite
  patch -p1 < $srcdir/coolkey-cache-dir-move.patch
  patch -p1 < $srcdir/coolkey-gcc43.patch
  patch -p1 < $srcdir/coolkey-latest.patch
  patch -p1 < $srcdir/coolkey-simple-bugs.patch
  patch -p1 < $srcdir/coolkey-thread-fix.patch
  patch -p1 < $srcdir/coolkey-cac.patch
  patch -p1 < $srcdir/coolkey-cac-1.patch
  patch -p1 < $srcdir/0001-Fix-working-with-empty-certificates-in-not-zero-slot.patch
 ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/coolkey-1.1.0"
  make DESTDIR="$pkgdir/" install
}
