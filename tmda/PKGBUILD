# Contributor: Bryan Ischo <bryan@ischo.com>
pkgname=tmda
pkgver=1.1.12
pkgrel=2
pkgdesc="Tagged Message Delivery Agent (for SPAM blocking)"
arch=(any)
url="http://tmda.net"
license=('GPL')
groups=()
depends=('python>=2.4')
makedepends=('python')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tgz)
noextract=()
md5sums=('b9b3f978572598072ae7a7fb055c8218')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./compileall || return 1

  mkdir -p "$pkgdir/usr/share" || return 1
  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/share/$pkgname" || return 1
  mkdir -p "$pkgdir/usr/bin" || return 1
  for i in bin/tmda-*; do
  	  ln -s "/usr/share/$pkgname/$i" "$pkgdir/usr/bin" || return 1
  done
  mkdir -p "$pkgdir/usr/share/doc" || return 1
  ln -s "/usr/share/$pkgname/doc" "$pkgdir/usr/share/doc/$pkgname" || return 1
}

# vim:set ts=2 sw=2 et:
