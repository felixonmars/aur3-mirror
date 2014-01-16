# Maintainer : Martin Wimpress <code@flexion.org>

pkgname=mate-mplayer
pkgver=1.0.8
pkgrel=2
pkgdesc="Mplayer GUI for MATE"
url="https://github.com/NiceandGently/mate-mplayer"
arch=('i686' 'x86_64')
license=('GPL')
depends=('curl' 'dbus-glib' 'desktop-file-utils' 'gmtk' 'gtk3' 'gvfs' 'libgpod' 'libnotify'
         'libmusicbrainz3' 'mate-control-center' 'mate-file-manager' 'mencoder' 'mplayer' 'pulseaudio')
makedepends=('mate-common' 'perl-xml-parser')
options=('!emptydirs')
source=("https://github.com/NiceandGently/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('05a5571f9ffc8493a0814065b78faa11')
install=${pkgname}.install

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
