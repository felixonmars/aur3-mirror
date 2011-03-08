# $Id: PKGBUILD 36041 2010-12-25 20:18:47Z lfleischer $
# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Alexey Yakovenko <waker@users.sourceforge.net>

pkgname=deadbeef_gbk
pkgver=0.4.4
pkgrel=1
pkgdesc='An audio player for GNU/Linux based on GTK2 with a GBK supporting patch'
arch=('i686' 'x86_64')
url='http://deadbeef.sourceforge.net'
license=('GPL2')
depends=('gtk2' 'libsamplerate' 'alsa-lib')
makedepends=('gtk2' 'libsamplerate' 'libvorbis' 'libmad' 'flac' 'curl' 'alsa-lib' 'wavpack' 'libsndfile' 'libcdio' 'libcddb' 'ffmpeg' 'libx11' 'faad2' 'zlib' 'intltool' 'pkgconfig' 'libpulse')
optdepends=('libvorbis: for Ogg Vorbis playback'
            'libmad: for MP1/MP2/MP3 playback'
            'flac: for FLAC playback'
            'curl: for Last.fm scrobbler, SHOUTcast, Icecast, Podcast support'
            'wavpack: for WavPack playback'
            'libsndfile: for Wave playback'
            'libcdio: audio cd plugin'
            'libcddb: audio cd plugin'
            'ffmpeg: for WMA, AA, OMA, AC, etc.'
            'libmms: for MMS protocol support'
            'faad2: for AAC/MP4 support'
            'dbus: for OSD notifications support'
            'pulseaudio: for PulseAudio output plugin'
            'libx11: for global hotkeys plugin')
options=('!libtool')
install='deadbeef.install'
source=("http://downloads.sourceforge.net/project/deadbeaf/deadbeef-${pkgver}.tar.bz2" "deadbeef.patch")
md5sums=('546e63d456d6a5625461019b15501e38'
         'ac266546c29085fecbf3c27a161b7c3d')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ../deadbeef.patch || return 1
  make prefix="${pkgdir}/usr" install
}
