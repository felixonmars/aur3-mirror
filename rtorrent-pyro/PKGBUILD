# Contributor: Christian Brassat, crshd at mail dot com
# Maintainer:  Skydrome <irc.freenode.net>
    
pkgname=rtorrent-pyro
_pkgname=${pkgname%-*}
pkgver=0.9.4
pkgrel=1
pkgdesc="rTorrent with Pyroscope patches"
url="https://code.google.com/p/pyroscope"
license=('GPLv2')
arch=('i686' 'x86_64')
depends=('libtorrent=0.13.4' 'curl' 'xmlrpc-c' 'libsigc++')
makedepends=('gcc>=4.7.0')
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
    
_pyrourl="https://raw.githubusercontent.com/pyroscope/rtorrent-ps/master/patches"
source=("http://libtorrent.rakshasa.no/downloads/${_pkgname}-${pkgver}.tar.gz"
                "${_pyrourl}/ps-ui_pyroscope_0.8.8.patch"
                "${_pyrourl}/pyroscope.patch"
                "${_pyrourl}/ui_pyroscope.patch"
                "${_pyrourl}/command_pyroscope.cc"
                "${_pyrourl}/ui_pyroscope.cc"
                "${_pyrourl}/ui_pyroscope.h")
    
md5sums=('fd9490a2ac67d0fa2a567c6267845876'
            '7a88f8ab5d41242fdf1428de0e2ca182'
            'bd04a0699b80c8042e1cf63a7e0e4222'
            '0a2bbaf74c7160ba33876dcc2f050f14'
            'ba7634da91480021330e6fa8084b50d5'
            '951b40c6d43caf0a3bffc5fffcc557d5'
            '1258acfc82c50a8f452ace87fef0b416')
    
prepare() {
    cd "${_pkgname}-${pkgver}"
    # Used by the the pyroscope patch to determine version we are patching to
    sed -i "s:\\(AC_DEFINE(HAVE_CONFIG_H.*\\):\1\\nAC_DEFINE(RT_HEX_VERSION, 0x000904, for CPP if checks):" configure.ac
    for i in ${srcdir}/*.patch; do
        patch -uNp1 -i "$i"
    done
    for i in ${srcdir}/*.{cc,h}; do
        ln -s $i src
    done
    sed -i 's:rTorrent \" VERSION:rTorrent-pyro " VERSION:' src/ui/download_list.cc
    
}
    
build() {
    cd "${_pkgname}-${pkgver}"
    export CXXFLAGS="${CXXFLAGS} -fno-strict-aliasing -std=c++11"
    ./autogen.sh
    ./configure --prefix=/usr --disable-debug --with-xmlrpc-c
    make
}
    
package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    #The man page is not in the repo
    #install -Dm644 doc/faq.xml      ${pkgdir}/usr/share/doc/rtorrent/faq.xml
    #install -Dm644 doc/rtorrent.1   ${pkgdir}/usr/share/man/man1/rtorrent.1
    install -Dm644 doc/rtorrent.rc  ${pkgdir}/usr/share/doc/rtorrent/rtorrent.rc
}


