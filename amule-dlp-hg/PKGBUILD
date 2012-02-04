# Maintainer: CUI Hao <cuihao.leo at gmail dot com>

pkgname=amule-dlp-hg
pkgver=20111016
pkgrel=1
pkgdesc="An eMule-like client for ed2k p2p network with DLP patch enhanced by Bill Lee. Mercurial developing version."
arch=('i686' 'x86_64')
url="http://code.google.com/p/amule-dlp/"
license=('GPL')
depends=('wxgtk' 'gd' 'geoip' 'libupnp' 'crypto++' 'libsm')
makedepends=('mercurial')
conflicts=('amule')
provides=('amule', 'amule-dlp')

_hgname="amule-dlp"

build() {
    cd "${srcdir}"
  
    msg "Connecting to Mercurial server..."
    if [ -d "$_hgname" ] ; then
        cd "$_hgname" && hg pull
        cd ..
    else
        hg clone https://amule-dlp.googlecode.com/hg/ ${_hgname}
    fi
  
    rm -rf "${_hgname}-build"
    cp -r "${_hgname}" "${_hgname}-build" 
    cd "${_hgname}-build"

    msg "Starting make..."
    ./configure --prefix=/usr \
        --mandir=/usr/share/man \
        --enable-cas \
        --enable-upnp \
        --enable-geoip \
        --enable-ccache \
        --enable-optimize \
        --disable-webserver \
        --enable-alc \
        --enable-alcc \
        --enable-wxcas \
        --disable-debug \
        --enable-amulecmd \
        --enable-amule-gui \
        --enable-amule-daemon \
        --enable-nls \
        --enable-mmap

    make
}

package() {
    cd "${srcdir}/${_hgname}-build"
    make DESTDIR=${pkgdir}/ install
}

