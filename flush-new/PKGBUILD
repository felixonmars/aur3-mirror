# Maintainer: Mephistopheles <mephisto.pheles.nyan@gmail.com>

pkgname=flush-new
pkgver=0.9.12
pkgrel=1
pkgdesc="GTK+ based BitTorrent client"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/flush/"
license=('GPL')
depends=('libconfig' 'libtorrent-rasterbar' 'libglademm' 'libnotify' 'dbus-core')
makedepends=('boost')
conflicts=('flush')
install=${pkgname}.install
source=(http://space.dl.sourceforge.net/project/flush/flush/${pkgver}/flush-${pkgver}.tar.bz2)


build() {
    cd "${srcdir}/flush-${pkgver}"

   # No idea what is it, but compiling works fine without. Curiosity never killed the cat, so ask previous maintaner. 
   # export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
    export CXXFLAGS="${CXXFLAGS} -DBOOST_FILESYSTEM_VERSION=2"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/flush-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}

md5sums=('6a9a9a218b3f060be899688dc29549ec')
