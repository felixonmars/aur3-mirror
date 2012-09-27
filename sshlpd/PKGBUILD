# Contributor: onny <onny@project-insanity.org>

pkgname=sshlpd
pkgver=20120510
pkgrel=2
pkgdesc="CUPS backend for printing via lpd through ssh."
arch=('i686' 'x86_64')
url="http://twofoos.org/content/labprinting/"
license=('GPL')
depends=('cups' 'perl-expect' 'foomatic-db' 'foomatic-db-engine')
source=("http://twofoos.org/resources/${pkgname}")
md5sums=('33384ec011c60837df1e63106f3f9fb6')

build() {
  mkdir -p "$pkgdir/usr/lib/cups/backend"
  sed -i 's/\/usr\/ucb\/lpr/\/usr\/bin\/lpr/g' $srcdir/$pkgname
  install -m 755 "$srcdir/${pkgname}" "$pkgdir/usr/lib/cups/backend/"
}

# vim:set ts=2 sw=2 et:
