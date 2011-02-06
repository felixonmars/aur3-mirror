# Contributor: Benoit Rouits <brouits@free.fr>
pkgname=cabestan
pkgver=0.2
pkgrel=1
pkgdesc="a mini Jackd transport interface"
arch=(i686)
url="http://herewe.servebeer.com/cabestan"
license=('GPL')
groups=()
depends=('gtk2' 'glib' 'jack-audio-connection-kit')
makedepends=('make' 'gcc' 'pkgconfig')
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://herewe.servebeer.com/cabestan/releases/$pkgname-$pkgver.tar.gz)
noextract=()

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX="/usr" || return 1
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
md5sums=('3e4781fa6e6b521c831ed99a9d46da33')
