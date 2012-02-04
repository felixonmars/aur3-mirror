# Maintainer: Julien "Adyxax" Dessaux <judessaux@gmail.com>
pkgname='mk-livestatus'
pkgver='1.1.8'
pkgrel='1'
pkgdesc='MK Livestatus is a Nagios event broker module that allows quick, direct and comfortable access to your status data.'
arch=('i686' 'x86_64')
url='http://mathias-kettner.de/download/mk-livestatus-1.1.8.tar.gz'
license=('GPL')
groups=()
depends=('gcc-libs')
makedepends=()
optdepends=()
provides=('mk-livestatus')
conflicts=()
replaces=()
backup=()
options=()
install=('mk-livestatus.install')
changelog=
source=("http://mathias-kettner.de/download/$pkgname-$pkgver.tar.gz" 'mk-livestatus.install')
noextract=()
md5sums=('405dbe36fb83afbc39716cca8f99ade6'
         '7480d1a3ace03bc442e622a525d66e40')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=$pkgdir/usr install
}

# vim:set ts=2 sw=2 et:
