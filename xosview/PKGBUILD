# Maintainer: Bernhard Walle <bernhard@bwalle.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

# AUR Category: system

pkgname=xosview
pkgver=1.14
pkgrel=1
pkgdesc="Displays system stats such as cpu, memory, swap, and network usage"
arch=(i686 x86_64)
depends=('gcc-libs' 'libxpm')
license=('GPL')
source=(http://www.pogo.org.uk/~mark/$pkgname/releases/$pkgname-$pkgver.tar.gz)
url="http://www.pogo.org.uk/~mark/xosview/"
sha256sums=('d2f8c0b9e25ad259d114963d64aa9d3c532398fcbbb4213f24a876a94fb23012')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  mkdir -p "$pkgdir/usr/{bin,man/man1,lib/X11/app-defaults}"
  cd "$srcdir/$pkgname-$pkgver"
  make "DESTDIR=$pkgdir" PREFIX=/usr MANDIR=/usr/share/man install 
}

# vim: ts=2 sw=2 et ft=sh
