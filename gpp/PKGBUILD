# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Michal Docekal <docekal@gmail.com>
# Contributor: Gary Ayre <catchfire@gmail.com>

pkgname=gpp
pkgver=0.7.0
pkgrel=2
pkgdesc="GNOME photo printer"
arch=('i686' 'x86_64')
url="http://www.fogman.de/?page_id=7"
license=('GPL')
depends=('desktop-file-utils' 'libgnomeprintui>=2.2' 'libgnomeui')
makedepends=('intltool>=0.35.0' 'pkgconfig>=0.6.0')
install=gpp.install
source=(http://fogman.de/gpp/gpp-$pkgver.tar.gz)
md5sums=('ff8fdd9a8f741b346a8d87045d1d02e3')

build() {
  cd "$srcdir/gpp-$pkgver"
  sed -i 's/s$/&;/; s/\.png//; s/0/false/' data/desktop/*.desktop
  LDFLAGS+="$(pkg-config --libs libgnomeui-2.0 libglade-2.0 libgnomeprint-2.2 libgnomeprintui-2.2)" \
    ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/gpp-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
