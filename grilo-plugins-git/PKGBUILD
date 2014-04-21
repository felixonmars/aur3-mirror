# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=grilo-plugins
pkgname=$_pkgname-git
pkgver=0.2.12.28.g8a70710
pkgrel=1
pkgdesc="Plugins for Grilo"
url="http://www.gnome.org"
arch=(i686 x86_64)
license=(LGPL)
depends=("grilo>=0.2.9" sqlite libgcrypt)
makedepends=(gupnp-av libgdata libquvi gmime rest libtracker-sparql totem-plparser libdmapsharing
             json-glib yelp-tools)
optdepends=('gupnp-av: uPnP plugin'
            'libgdata: Youtube plugin'
            'libquvi: Youtube plugin, Vimeo plugin'
            'gmime: Podcasts plugin'
            'rest: Blip.tv plugin'
            'libtracker-sparql: Tracker plugin'
            'totem-plparser: Optical media plugin'
            'libdmapsharing: DMAP sharing plugin'
            'json-glib: TMDb plugin')
provides=("${_pkgname}=0.2.13")
conflicts=($_pkgname)
options=('!libtool' '!emptydirs')
source=(git://git.gnome.org/$_pkgname)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe | sed 's/grilo-plugins-//' | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
    --disable-static --enable-shoutcast
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
