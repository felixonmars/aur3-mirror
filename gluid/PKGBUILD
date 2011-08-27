# Contributor: Benoit Rouits <brouits@free.fr>
pkgname=gluid
pkgver=0.8
pkgrel=1
pkgdesc="a mini Fluidsynth graphical interface"
arch=(i686)
url="http://herewe.servebeer.com/gluid"
license=('GPL')
groups=()
depends=('gtk2' 'glib' 'fluidsynth')
makedepends=('make' 'gcc' 'pkgconfig')
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://herewe.servebeer.com/gluid/releases/$pkgname-$pkgver.tar.gz)
noextract=()

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX="/usr" || return 1
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
md5sums=('f9c9a607fedff969496c48d20bf304d3')
