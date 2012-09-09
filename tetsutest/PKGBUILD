# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Maintainer: Ben Reedy <thebenj88 *AT* gmail *DOT* com>

pkgname=tetsutest
_realname=abgx360
pkgver=1.0.6
pkgrel=1
pkgdesc="An app for checking Xbox 360 ISOs"
arch=('i686' 'x86_64')
url="http://abgx360.net/"
license=('unknown')
depends=('curl' 'zlib')
source=(https://dl.dropbox.com/u/59058148/$_realname-$pkgver.tar.gz)
sha256sums=('d73e0270383ff9c150224e1f687d1d5643b4c23752cfaec2dcfde8a12db5a8f7')

build() {
  cd "${srcdir}/$_realname-${pkgver}"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="${pkgdir}/" install || return 1
}
