# Contributor: Florian Breitwieser <florian.bw_at_gmail.com

pkgname=rapache
pkgver=1.2.2
pkgrel=1
pkgdesc="Web Application Development with R and Apache"
arch=('i686' 'x86_64')
url="http://biostat.mc.vanderbilt.edu/rapache/index.html"
license=('GPL')
depends=('apache' 'r' 'perl-libapreq2')
makedepends=('intltool')
install=${pkgname}.install
source=(http://biostat.mc.vanderbilt.edu/rapache/$pkgname-$pkgver.tar.gz)
md5sums=('2ea7ceedb504c59bd22053c4f5725d12')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-apache2-apxs=/usr/sbin/apxs
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}
