# $Id$
# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Bartek Piotrowski <barthalion@gmail.com>

# Similar packages:
# http://anonscm.debian.org/gitweb?p=pkg-multimedia/mplayer2.git
#http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-multimedia/mplayer

pkgname=mplayer2
_commit=74ad0b4
pkgver="2.0.20120411+g${_commit}"
_snapshot="${pkgname}-${_commit}"
pkgrel=1
pkgdesc="A movie player"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.mplayer2.org/"
depends=('libgl' 'libvdpau' 'ffmpeg' 'libdvdcss' 'libdvdread' 'libdvdnav' 'libxvmc' 'libass' 'fontconfig' 'freetype2'
         'ttf-dejavu' 'sdl' 'aalib' 'libcaca' 'faad2' 'libpulse' 'jack' 'ncurses' 'libxxf86vm' 'cdparanoia' 'libmad'
         'a52dec' 'libdca' 'libxxf86dga' 'libxss' 'mpg123' 'ladspa')
makedepends=('mesa' 'unzip' 'yasm' 'git')
backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
provides=('mplayer')
conflicts=('mplayer')
source=("http://git.${pkgname}.org/${pkgname}/snapshot/${_snapshot}.tar.xz")
sha1sums=('531159114b8e409385b7eb90220db462eec432ef')
options=('!emptydirs')

build() {
    cd "${srcdir}/${_snapshot}"

    ./configure --prefix=/usr \
                --enable-runtime-cpudetection \
                --disable-arts \
                --disable-speex \
                --disable-openal \
                --disable-libdv \
                --disable-musepack \
                --disable-esd \
                --disable-mga \
                --language=all \
                --enable-translation \
                --confdir=/etc/mplayer
    make
}

package() {
    cd "${srcdir}/${_snapshot}"

    make DESTDIR="${pkgdir}" install
    install -Dm644 etc/{codecs.conf,input.conf,example.conf} "${pkgdir}"/etc/mplayer/
    install -dm755 "${pkgdir}"/usr/share/mplayer/
    ln -s /usr/share/fonts/TTF/DejaVuSans.ttf "${pkgdir}"/usr/share/mplayer/subfont.ttf

    install -dm755 "${pkgdir}"/usr/share/applications/
    install -m 644 etc/mplayer.desktop "${pkgdir}"/usr/share/applications/
}
