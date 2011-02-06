# $Id$
# Maintainer: Torrid Luna <torrid@virtyou.com>
# Contributor: Torrid Luna <torrid@virtyou.com>
pkgname=gwhois
pkgver=20100728
pkgrel=1
pkgdesc="gwhois is a generic whois client to traverse your requests to the right server."
arch=(any)
url="http://gwhois.de/"
license=('GPL')
groups=()
depends=("perl-net-libidn" "perl-lwp-simple" "curl" "lynx")
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://gwhois.de/gwhois/gwhois_20100728.tar.gz)
changelog=
noextract=()
md5sums=('2b087f310916cb0b268d5107748aef87')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/etc/gwhois 
  cp -a pattern $pkgdir/etc/gwhois/
  mkdir -p $pkgdir/usr/bin/
  cp gwhois $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/man/man1
  cp gwhois.1 $pkgdir/usr/share/man/man1
}

# vim:set ts=2 sw=2 et:
