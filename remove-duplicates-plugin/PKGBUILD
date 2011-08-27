# Contributor: Ralph Eastwood <tcmreastwood@ntlworld.com>
pkgname=remove-duplicates-plugin
pkgver=0.0.4
pkgrel=2
pkgdesc="Removes duplicate emails from Evolution Mail Client"
arch=(i686 x86_64)
url="http://www.gnome.org/~carlosg/stuff/evolution/"
license=('GPL')
groups=()
depends=('evolution')
makedepends=()
provides=('remove-duplicates-plugin')
conflicts=('remove-duplicates-plugin')
replaces=()
backup=()
options=()
install=
source=(http://www.gnome.org/~carlosg/stuff/evolution/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('aac7a520a5eb6dc699ef38fe9a5d1960')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
