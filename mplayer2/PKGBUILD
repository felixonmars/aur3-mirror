# $Id$
# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Bartek Piotrowski <barthalion@gmail.com>

pkgname=mplayer2
_commit=3a39fc1
pkgver="2.0.20111114+g${_commit}"
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
sha1sums=('ae4542ae6bbe00110aed32708d097ec5f611f0de')
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
                --confdir=/etc/mplayer \
                --disable-live  # Disabled by default in Uoti’s Git branch
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
