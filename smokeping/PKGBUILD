# Maintainer: Christos Nouskas nous <nous at archlinux.us>

pkgname=smokeping
pkgver=2.6.9
pkgrel=1
pkgdesc="A tool to keep track of your network latency"
arch=('any')
url="http://oss.oetiker.ch/smokeping/"
license=('GPL2')
depends=('perl-config-grammar' 'perl-digest-hmac' 'perl-libwww' 'rrdtool' 'perl-fcgi')
makedepends=()
source=(http://oss.oetiker.ch/smokeping/pub/smokeping-${pkgver}.tar.gz)
install=${pkgname}.install

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
pwd
  ./configure --prefix=/usr --sysconfdir=/etc/smokeping --with-htdocs-dir=/srv/http/smokeping
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}

sha256sums=('cd551d4384d8b19879d128ea0566bd680c19bb4ad8664a3c5a304604746f8863')
