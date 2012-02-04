pkgname=mplayer2-encode-git
pkgver=20111227
pkgrel=1
pkgdesc="A movie player for linux (uses statically linked libav; git version; includes encode support)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.mplayer2.org/"
depends=('libgl' 'libvdpau' 'ffmpeg' 'libdvdcss' 'libdvdread' 'libdvdnav' 'libxvmc' 'libass' 'fontconfig' 'freetype2'
	'ttf-dejavu' 'sdl' 'aalib' 'libcaca' 'faad2' 'libpulse' 'jack' 'ncurses' 'libxxf86vm' 'cdparanoia' 'libmad' 
	'a52dec' 'libdca' 'libxxf86dga' 'libxss' 'mpg123' 'ladspa' 'opencore-amr' 'x264' 'libvorbis' 'xvidcore' 'lame'
	'libvpx' 'libtheora' 'faac')
makedepends=('live-media' 'mesa' 'unzip' 'yasm' 'videoproto' 'git')
backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
provides=('mplayer')
conflicts=('mplayer')
source=('mplayer.desktop')
md5sums=('af6ba58cc34322bf12e46e8d1d42d75f')

_gitroot="git://git.mplayer2.org/divverent/mplayer2-build-sh.git"
_gitname="mplayer2"

build() {
	# Custom CFLAGS break the mplayer build

	unset CFLAGS
	unset LDFLAGS

	cd "${srcdir}"
	if [[ -d "${_gitname}" ]]; then
		cd "${_gitname}"
		./update
	else
		git clone "${_gitroot}" "${_gitname}" && cd "${_gitname}"
		./init
	fi
	./enable-encoding

	echo "--prefix=/usr
--language=all
--confdir=/etc/mplayer
--disable-arts
--disable-speex
--disable-openal
--disable-libdv
--disable-musepack
--disable-esd
--disable-mga" > mplayer_options

	echo "--enable-libmp3lame
--enable-libvorbis
--enable-libxvid
--enable-libx264
--enable-libvpx
--enable-libtheora
--enable-libfaac
--enable-postproc
--enable-libopencore_amrnb
--enable-libopencore_amrwb
--enable-version3
--enable-nonfree" > libav_options

	cd "${srcdir}"
	rm -rf "${_gitname}-build"
	cp -r "${_gitname}" "${_gitname}-build"
	cd "${_gitname}-build"

	msg "Starting make..."

	make
}

package() {
	cd "${srcdir}/${_gitname}-build"

	make DESTDIR="${pkgdir}" install

	install -m644 mplayer/etc/{codecs,input,example}.conf "${pkgdir}/etc/mplayer/"
	install -d -m755 "${pkgdir}/usr/share/mplayer"
	ln -s /usr/share/fonts/TTF/DejaVuSans.ttf "${pkgdir}/usr/share/mplayer/subfont.ttf"

	# there is a desktop file where the xpm is, but we don't want that
	install -Dm644 "${srcdir}/mplayer.desktop" "${pkgdir}/usr/share/applications/mplayer.desktop"
	install -Dm644 "${srcdir}/${_gitname}/mplayer/etc/mplayer.xpm" "${pkgdir}/usr/share/pixmaps/mplayer.xpm"
}
