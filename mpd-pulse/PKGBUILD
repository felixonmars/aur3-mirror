# MPD-Pulse: Installer: Arch
# Mantainer: Jan Fader <jan [at] faderweb [dot] de>

basename=mpd
pkgname=${basename}-pulse
fullname=musicpd
pkgver=0.15.12
pkgrel=1
pkgdesc="Music daemon that plays MP3, FLAC, and Ogg Vorbis files; with PulseAudio support"
arch=(i686 x86_64)
license=("GPL")
url="http://${fullname}.org"
depends=('libao' 'ffmpeg' 'libmodplug' 'audiofile' 'libshout' 'libmad' 'curl'
         'sqlite3' 'libsamplerate' 'libmms' 'wavpack' 'libmpcdec' 'avahi' 'libid3tag'
         'pulseaudio')
provides=("${basename}")
conflicts=("${basename}")
install="${basename}.install"
source=("http://downloads.sourceforge.net/${fullname}/${basename}-${pkgver}.tar.bz2"
        'mpd')
md5sums=('b00b289a20ecd9accfd4972d6395135c'
         '84583825d4a191aeb89f5709a3808118')

build() {
  cd ${srcdir}/${basename}-${pkgver}
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --enable-lastfm \
    --disable-cue \
    --disable-sidplay \
    --enable-pulse || return 1
  make || return 1
}

package() {
  cd ${srcdir}/${basename}-${pkgver}
  make DESTDIR=${pkgdir} install || return 1

  # set ours dirs in mpd.conf file
  sed -i 's|^music_directory.*$|#music_directory "path_to_your_music_collection"|1' doc/mpdconf.example
  sed -i 's|playlist_directory.*$|playlist_directory "/var/lib/mpd/playlists"|1' doc/mpdconf.example
  sed -i 's|db_file.*$|db_file "/var/lib/mpd/mpd.db"|1' doc/mpdconf.example
  sed -i 's|log_file.*$|log_file "/var/log/mpd/mpd.log"|1' doc/mpdconf.example
  sed -i 's|error_file.*$|error_file "/var/log/mpd/mpd.error"|1' doc/mpdconf.example
  sed -i 's|#pid_file.*$|pid_file "/var/run/mpd/mpd.pid"|1' doc/mpdconf.example
  sed -i 's|#state_file.*$|state_file "/var/lib/mpd/mpdstate"|1' doc/mpdconf.example
  sed -i 's|#user.*$|user "mpd"|1' doc/mpdconf.example

  install -Dm644 doc/mpdconf.example ${pkgdir}/etc/mpd.conf.example || return 1

  install -Dm755 ${srcdir}/mpd ${pkgdir}/etc/rc.d/mpd || return 1
  install -d ${pkgdir}/var/{lib/mpd/playlists,log/mpd} || return 1
}
