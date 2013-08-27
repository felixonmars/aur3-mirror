# Maintainer: Gregor Robinson <gregor@fiatflux.co.uk>
# Contributor: Stas <stas@mainframe.lv>

pkgname=opensc-git
_gitname="OpenSC"
pkgver=0.13.0.105.g3afe644
pkgrel=1
pkgdesc="Access smart cards that support cryptographic operations"
arch=('i686' 'x86_64')
url="http://www.opensc-project.org/"
license=('LGPL2.1')
makedepends=('docbook-xsl' 'nasm' 'git')
depends=('openssl' 'pcsclite' 'pinentry')
optdepends=('ccid' 'zlib')
conflicts=('opensc')
provides=('opensc')
source=('git+https://github.com/OpenSC/OpenSC.git')
md5sums=('SKIP')


pkgver() {
    cd $_gitname
    git describe --always | sed 's|-|.|g'
}

build() {
    cd $_gitname
    ./bootstrap
    _sheetdir=(/usr/share/xml/docbook/xsl-stylesheets-*)
    ./configure --prefix=/usr --sysconfdir=/etc --enable-pcsc --enable-sm \
        --enable-dnie-ui --enable-doc --with-xsl-stylesheetsdir="${_sheetdir}"
    make
}

package() {
    cd $_gitname
    make DESTDIR=${pkgdir} install
    mkdir -p ${pkgdir}/usr/share/licenses/opensc
    install -Dm644 COPYING* "${pkgdir}/usr/share/licenses/opensc/"
}
