# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: damir <damir@archlinux.org>
# Contributor: phrakture

pkgname=acct
pkgver=6.5.5
pkgrel=1
pkgdesc="The GNU Accounting Utilities provide login and process accounting utilities for GNU/Linux and other systems."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/acct/"
license=('GPL')
depends=('glibc')
install="$pkgname.install"
source=("http://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('554a9e9c6aa3482df07e80853eac0350')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # Renaming last
  mv "$pkgdir/usr/bin/last" "$pkgdir/usr/bin/last-acct"
  mv "$pkgdir/usr/share/man/man1/last.1" "$pkgdir/usr/share/man/man1/last-acct.1"
}
