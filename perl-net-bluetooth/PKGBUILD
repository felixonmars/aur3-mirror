# Maintainer: Sam Stuewe <halosghost at archlinux dot info>

pkgname=perl-net-bluetooth
pkgver=0.40
pkgrel=1
pkgdesc='The Perl Bluetooth Interface'
url='http://search.cpan.org/~iguthrie/Net-Bluetooth-0.40/'
arch=('any')
license=('unknown')
depends=('bluez' 'perl')
makedepends=('bluez-libs')
source=("http://search.cpan.org/CPAN/authors/id/I/IG/IGUTHRIE/Net-Bluetooth-${pkgver}.tar.gz")
sha256sums=('62cd1f79f5edd7d90a483bb5488d1cfbca0b887b84d0f22b21574fff4e659fd1')

build() {
   cd "${srcdir}/Net-Bluetooth-${pkgver}"
   perl Makefile.PL
   make
}

check() {
   cd "${srcdir}/Net-Bluetooth-${pkgver}"
   make test
}

package() {
   cd "${srcdir}/Net-Bluetooth-${pkgver}"
   make DESTDIR="${pkgdir}" install
}
