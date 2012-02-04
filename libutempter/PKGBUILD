# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=libutempter
pkgver=1.1.5
pkgrel=3
pkgdesc="A interface for terminal emulators such as screen and xterm to record user sessions to utmp and wtmp files"
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/libutempter"
license=('LGPL2')
depends=('glibc')
install=libutempter.install
source=(ftp://ftp.altlinux.org/pub/people/ldv/utempter/$pkgname-$pkgver.tar.bz2)
md5sums=('d62a93ba9f3796a91cf03be5ef25a9a1')

build() {
  cd $srcdir/$pkgname-$pkgver

  make || return 1
  make DESTDIR=$pkgdir install
  rm $pkgdir/usr/lib/libutempter.a
}

# vim:set ts=2 sw=2 et:
