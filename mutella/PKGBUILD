# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=mutella
pkgver=0.4.5
pkgrel=3
pkgdesc="An intuitive Gnutella client with console and http interfaces"
arch=('i686' 'x86_64')
url="http://mutella.sourceforge.net/"
license=('GPL')
depends=('gcc-libs' 'readline' 'zlib')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        $pkgname-$pkgver.diff)
md5sums=('1a676eacf562e3b8de90493f99fe059c'
         'f8e2dff67da823ffbda95c760c6372e0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../$pkgname-$pkgver.diff
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
