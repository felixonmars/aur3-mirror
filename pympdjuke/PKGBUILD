# Contributor: Thomas Lundgaard <thomaslundgaard at gmail>
pkgname="pympdjuke"
pkgver=1.0beta1
pkgrel=1
pkgdesc="A small mpd frontend, intended to be used as a jukebox at parties. With on-screen keyboard for fancy touch-screens."
arch=(i686 x86_64)
url="http://github.com/thomaslundgaard/PyMpdJuke"
license=('GPLv3')
groups=()
depends=(python-mpd pyqt)
makedepends=()
optdepends=(mpd)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=()
source=("http://cloud.github.com/downloads/thomaslundgaard/PyMpdJuke/$pkgname-$pkgver.tar.bz2")
noextract=()
md5sums=(56a67ced8733f72e152d18fddfbf955b)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
  make DESTDIR="$pkgdir/usr" install || return 1
}

# vim:set ts=2 sw=2 et:
