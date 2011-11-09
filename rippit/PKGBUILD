# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=rippit
pkgver=0.1.0
pkgrel=1
pkgdesc="The No-Nonsense media ripper"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/rippit/"
license=('GPL')
depends=('libmusicbrainz3' 'gstreamer0.10')
makedepends=('cmake' 'help2man')
source=("https://fedorahosted.org/releases/r/i/rippit/rippit-$pkgver.tar.bz2")
sha256sums=('63a4afa4ce1f6389c36cacbdd416046ce99750a00ae36e4e7f835e06ee20edb6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
