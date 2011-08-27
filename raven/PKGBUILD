# Maintainer: Thomas A. Alvarado Davalos <alvdav86@gmail.com>
# Contributor: Thomas A. Alvarado Davalos <alvdav86@gmail.com>
pkgname=raven
pkgver=20071127 
pkgrel=1
pkgdesc="Stack based programming language."
arch=(i686 x86_64)
url="http://aerosuidae.net/raven.html"
license=('GPL')
groups=
provides=
depends=('libmysqlclient' 'pcre' 'readline' 'openssl' 'sqlite2')
makedepends=('termcap')
conflicts=
replaces=
backup=
install=
source=(http://aerosuidae.net/$pkgname$pkgver.tgz)
md5sums=('5a2feaba94944f94714db4a1ca13af5c')

build() {
  cd $srcdir/$pkgname$pkgver
  ./configure
  echo -e "\nRaven 20071127, Copyright (C) 2005-2007 Sean Pringle, mythago.net
Raven comes with ABSOLUTELY NO WARRANTY; for details type LICENSE\n"

echo -e "NOTE: GCC WOULD PRINT A LOT OF WARNIGS NOW IF 
I WOULD NOT REDIRECT THEM TO /DEV/NULL...\n"
  make 2>/dev/null
}

package() {
  cd "$srcdir/$pkgname$pkgver"
  mkdir -p $pkgdir/usr/local/bin
  cp raven $pkgdir/usr/local/bin
}
