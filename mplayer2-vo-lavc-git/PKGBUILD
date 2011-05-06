# Maintainer: cantabile <cantabile dot desu at gmail dot com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Bartek Piotrowski <barthalion@gmail.com>

pkgname=mplayer2-vo-lavc-git
pkgver=20110506
pkgrel=1
pkgdesc="divVerent's branch with encoding functionality"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/divVerent/mplayer"
depends=('libgl' 'libvdpau' 'ffmpeg' 'libdvdcss' 'libdvdread' 'libdvdnav' 'libxvmc' 'libass' 'fontconfig' 'freetype2' 'ttf-dejavu'
         'sdl' 'aalib' 'libcaca' 'faad2' 'libpulse' 'jack' 'ncurses' 'libxxf86vm' 'cdparanoia' 'libmad' 'a52dec' 'libdca' 'libxxf86dga')
makedepends=('live-media' 'mesa' 'unzip' 'yasm' 'git')
provides=('mplayer')
conflicts=('mplayer')

_gitroot="git://github.com/divVerent/mplayer.git"
_gitname="mplayer2-vo-lavc"

build() {
   cd "${srcdir}"
   if [[ -d "${_gitname}" ]]; then
      cd "${_gitname}"
      git pull
   else
      git clone "${_gitroot}" "${_gitname}" && cd "${_gitname}"
   fi

   # Custom CFLAGS break the mplayer build
   unset CFLAGS LDFLAGS

    ./configure --prefix=/usr \
               --confdir=/etc/mplayer
   make
}

package() {
   cd "${srcdir}/${_gitname}"
   make DESTDIR="${pkgdir}" install
   install -Dm644 etc/{codecs.conf,input.conf,example.conf} "${pkgdir}"/etc/mplayer/
   install -dm755 "${pkgdir}"/usr/share/mplayer/
   ln -s /usr/share/fonts/TTF/DejaVuSans.ttf "${pkgdir}"/usr/share/mplayer/subfont.ttf
}
