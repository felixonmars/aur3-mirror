# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Daniel Balieiro <daniel@balieiro.com>

pkgname=telepathy-inspector
pkgver=0.5.3
pkgrel=2
pkgdesc="A Telepathy client for exposing interfaces and functionalities of connection managers"
arch=('i686' 'x86_64')
url="http://telepathy.freedesktop.org/"
license=('GPL')
depends=('libglade' 'telepathy-glib')
makedepends=('pkgconfig>=0.9')
source=(http://telepathy.freedesktop.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('5252408e479cf48ba70016b61e5f7650')

build() {
  cd $pkgname-$pkgver

  ./configure	--prefix=/usr \
		--disable-static

  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
