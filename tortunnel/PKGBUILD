# Contributor: DigitalPathogen <aur@InfoSecResearchLabs.co.uk>

pkgname=tortunnel
pkgver=0.2
pkgrel=1
pkgdesc="a partial Onion Proxy implementation that's designed to build single-hop circuits through TOR exit nodes."
arch=('i686' 'x86_64')
url="http://www.thoughtcrime.org/software/tortunnel/"
license=('GPL3')
depends=('boost' 'openssl')
source=(http://www.thoughtcrime.org/software/tortunnel/$pkgname-$pkgver.tar.gz)
md5sums=('a7e0b864d3da2a4a0846983e2ae17441')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
