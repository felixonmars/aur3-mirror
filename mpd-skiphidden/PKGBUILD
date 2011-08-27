# Maintainer: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>
# Contributor: eWoud <ewoud.nuyts@gmail.com>

pkgname=mpd-skiphidden
_pkgname=mpd
conflicts=('mpd')
provides=('mpd')
pkgver=0.15.5
pkgrel=1
pkgdesc="Music daemon that plays MP3, FLAC, and Ogg Vorbis files (skips hidden files)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://musicpd.org"
depends=('libao' 'ffmpeg' 'libmodplug' 'audiofile' 'libshout' 'libmad' 'curl' 
         'sqlite3' 'libsamplerate' 'libmms' 'libmikmod' 'wavpack' 'libmpcdec')
makedepends=('pkgconfig')
install=mpd.install
source=(http://downloads.sourceforge.net/project/musicpd/mpd/${pkgver}/mpd-${pkgver}.tar.bz2
        'mpd'
        'hide-dot-files.diff')
md5sums=('078bd45c8266ac577e4a96fa38d1e534'
         'b1fd15de359db08e4b9ae4b199640f0e'
         'b40b4f186440bb1373d4621e957e00d8')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch -p0 -i ${srcdir}/hide-dot-files.diff || exit 1
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-jack \
    --enable-ao \
    --enable-mikmod \
    --with-zeroconf=no
  make || return 1
  make DESTDIR=${pkgdir} install

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

  install -D ${srcdir}/mpd ${pkgdir}/etc/rc.d/mpd || return 1
  install -d ${pkgdir}/var/lib/mpd/playlists ${pkgdir}/var/log/mpd ${pkgdir}/var/run/mpd
}
