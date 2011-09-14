# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Jonathan Lestrelin <zanko@daemontux.org>

pkgname=grilo-plugins
pkgver=0.1.17
pkgrel=1
pkgdesc="A framework focused on making media discovery and browsing easy for application developers."
arch=('i686' 'x86_64')
url="http://www.clutter-project.org"
license=('LGPL')
depends=('grilo>=0.1.17')
makedepends=('rest' 'gmime' 'gupnp-av' 'libgdata' 'quvi' 'sqlite3' 'tracker')
optdepends=('quvi: youtube plugin'
            'libgdata: youtube plugin'
            'rest: bliptv plugin'
            'tracker: tracker plugin'
            'gupnp-av: gupnp plugin'
            'gmime: podcast plugin'
            'sqlite3: podcast bookmark and metadatastore plugin')
options=('!libtool')
source=("http://ftp.gnome.org/pub/GNOME/sources/$pkgname/0.1/$pkgname-$pkgver.tar.bz2")
sha256sums=('5a04b29095a958e4ec414fe05ba0bcae9212756c5ac102b575e028cbd254f234')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --enable-static=no \
              --enable-shoutcast
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
