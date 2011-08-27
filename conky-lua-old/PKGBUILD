# Maintainer: Renato Garcia <fgar.renato@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor:  Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-lua-old
_pkgname=conky
pkgver=1.8.0
pkgrel=1
pkgdesc='An advanced, highly configurable system monitor for X based on torsmo'
arch=('i686' 'x86_64')
url='http://conky.sourceforge.net/'
license=('custom')
replaces=('torsmo')
depends=('alsa-lib' 'libxml2' 'curl' 'wireless_tools' 'libxft' 'glib2' 'libxdamage' 'imlib2' 'lua' 'cairo')
makedepends=('pkgconfig' 'toluapp')
provides=('conky=1.8.1')
conflicts=('conky','conky-lua')
backup=('etc/conky/conky.conf' 'etc/conky/conky_no_x11.conf')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha1sums=('a4450c764a673de71ea6b7ac5dabc534ebb516ab')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-wlan \
        --enable-rss \
        --enable-ibm \
        --enable-imlib2 \
        --enable-lua \
        --enable-lua-cairo \
        --enable-lua-imlib2
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

