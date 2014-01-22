# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Piotr Gorski <sir_lucjan@openlinux.pl>

pkgname=mate-applets-1.7
_pkgname=mate-applets
pkgver=1.7.0
pkgrel=1
pkgdesc="Applets for MATE panel"
arch=('i686' 'x86_64')
url="http://mate-desktop.org"
license=('GPL')
depends=('gucharmap' 'mate-panel' 'python2-dbus' 'python2-gobject' 'upower')
makedepends=('docbook2x' 'docbook-xsl' 'mate-common' 'networkmanager' 'perl-xml-parser' 'yelp-tools')
optdepends=('yelp: for reading MATE help documents')
options=('!emptydirs')
groups=('mate-extra')
conflicts=(mate-applets)
provides=(mate-applets)
replaces=(mate-applets)
source=("http://pub.mate-desktop.org/releases/1.7/${_pkgname}-${pkgver}.tar.xz")
sha1sums=('312756155852b2fe693ab3ea5a130f55689f7a24')
install=${_pkgname}.install

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    # Use python2
    sed -i 's/env python/env python2/' invest-applet/invest/{chart.py,invest-applet.py,mate-invest-chart}
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    PYTHON=/usr/bin/python2 ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/${_pkgname} \
        --enable-polkit \
        --enable-networkmanager \
        --enable-ipv6 \
        --disable-static
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    sed -i 's/env python/env python2/' "${pkgdir}/usr/lib/${_pkgname}/invest-applet"
}