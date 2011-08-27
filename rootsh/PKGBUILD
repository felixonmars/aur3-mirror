# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=rootsh
pkgver=1.5.3
pkgrel=1
pkgdesc="Rootsh is a wrapper for shells which logs all echoed keystrokes and terminal output to a file and/or to syslog. "
arch=('i686')
url="https://sourceforge.net/projects/rootsh/"
license=('GPL')
depends=('glibc')
source=(http://downloads.sourceforge.net/rootsh/$pkgname-$pkgver.tar.gz)
md5sums=('af62e6140338c9b2e8e8f6e828fda1ac') 

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make bindir=$pkgdir/usr/bin mandir=$pkgdir/usr/share/man install
}

# vim:set ts=2 sw=2 et:
