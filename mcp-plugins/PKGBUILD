# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=mcp-plugins
_pkgname=MCP-plugins
pkgver=0.4.0
pkgrel=2
pkgdesc="LADSPA plugins designed for Alsa Modular Synth"
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/index.html"
license=('GPL')
depends=('gcc-libs')
source=(http://kokkinizita.linuxaudio.org/linuxaudio/downloads/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('2a0fc50281a150eb781dbcfe2fb9c532')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/lib/ladspa/"
    install -m755 *.so "${pkgdir}/usr/lib/ladspa/"
}
