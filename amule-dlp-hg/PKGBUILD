# Maintainer: CUI Hao <cuihao.leo at gmail dot com>

pkgname=amule-dlp-hg
pkgver=20111016
pkgrel=2
pkgdesc="An eMule-like client for ed2k p2p network with DLP patch enhanced by Bill Lee. Mercurial developing version."
arch=('i686' 'x86_64')
url="http://code.google.com/p/amule-dlp/"
license=('GPL')
depends=('wxgtk' 'gd' 'geoip' 'libupnp' 'crypto++' 'libsm')
makedepends=('mercurial')
conflicts=('amule')
provides=('amule', 'amule-dlp')
source=('ftbfs-gcc-4.7.diff')
sha1sums=('34b3525a3ede765b396782f47e5fe7a54f70ca06')
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

    patch -Np1 -i "../ftbfs-gcc-4.7.diff"
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

