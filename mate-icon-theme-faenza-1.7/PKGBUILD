# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Piotr Gorski <sir_lucjan@openlinux.pl>

pkgname=mate-icon-theme-faenza-1.7
_pkgname=mate-icon-theme-faenza
pkgver=1.7.0
pkgrel=1
pkgdesc="Faenza icon theme for MATE"
url="http://mate-desktop.org"
arch=('any')
license=('LGPL')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
makedepends=('icon-naming-utils' 'mate-common')
options=(!strip)
conflicts=(mate-icon-theme-faenza)
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/1.7/${_pkgname}-${pkgver}.tar.xz")
sha1sums=('7ea7b2d0319a483e7311c705d835925ed9251159')
install=${_pkgname}.install

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    rm -f "${pkgdir}/usr/share/icons/matefaenza/icon-theme.cache"
}