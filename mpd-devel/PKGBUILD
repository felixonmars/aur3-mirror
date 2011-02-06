# Contributor: Juan Diego Tascon

pkgname=mpd-devel
pkgver=0.15
pkgrel=1
pkgdesc="music daemon that plays mp3, flac, aac, mod, wav, mpc and ogg files"
url="http://musicpd.org"
depends=(
	'alsa-lib' 'audiofile' 'curl' 'faad2>=2.6.1' 'ffmpeg' 'flac>=1.1.3' 'glib2'
	'libao' 'libcdio' 'libid3tag' 'libmad' 'libmikmod' 'libmodplug' 
	'libmpcdec>=1.2.5' 'libsamplerate' 'libshout' 'wavpack' 'zziplib'
)
makedepends=('autoconf' 'automake' 'git' 'libtool' 'pkgconfig')
optdepends=(
	'avahi: Support for Avahi Zeroconf Backend'
	'jack-audio-connection-kit: Support for JACK Audio'
	'libao-pulse: Support for the PulseAudio Sound Server'
	'libcue: Support for embedded cuesheets'
	'libmms: Support for MMS Protocol'
	'sqlite3: Support for SQLite Database'
)
license=('GPL')
arch=('i686' 'x86_64')
conflicts=('mpd')
provides=('mpd')
install=mpd.install
source=("http://downloads.sourceforge.net/sourceforge/musicpd/mpd-$pkgver.tar.bz2" "mpd.init")
md5sums=('2ed93a60bd703ba46d6794e12cfb5f1d' 'b1fd15de359db08e4b9ae4b199640f0e')

build() {
	cd $srcdir/mpd-$pkgver
	
	# Configure Source
    ./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		#--enable-ao \
		#--enable-bzip2 \
		#--enable-iso9660 \
		#--enable-lastfm \
		#--enable-modplug \
		#--enable-zip \
		#--disable-jack \
		#--disable-pulse \
		--with-zeroconf=no 
		#--enable-cue \
		#--enable-sqlite \
		#--enable-mms \
		#--enable-mvp
    
	# Build Source
	make || return 1
	
	# Install Source
	make prefix=$pkgdir/usr install

	# Create Directories
	install -d $pkgdir/var/{log/mpd,run/mpd,lib/mpd/playlists}
	
	# Install init Script
	install -D -m755 $srcdir/mpd.init $pkgdir/etc/rc.d/mpd

	# Install Sample Config
	install -D -m644 $srcdir/mpd-$pkgver/doc/mpdconf.example $pkgdir/etc/mpd.conf.example

    # Modify Sample Config with Proper Directories and User Settings
	/bin/sed -i 's|music_directory.*$|#music_directory "path_to_your_music_collection"|1' $pkgdir/etc/mpd.conf.example
	/bin/sed -i 's|playlist_directory.*$|playlist_directory "/var/lib/mpd/playlists"|1' $pkgdir/etc/mpd.conf.example
	/bin/sed -i 's|db_file.*$|db_file "/var/lib/mpd/mpd.db"|1' $pkgdir/etc/mpd.conf.example
	/bin/sed -i 's|log_file.*$|log_file "/var/log/mpd/mpd.log"|1' $pkgdir/etc/mpd.conf.example
	/bin/sed -i 's|error_file.*$|error_file "/var/log/mpd/mpd.error"|1' $pkgdir/etc/mpd.conf.example
	/bin/sed -i 's|#pid_file.*$|pid_file "/var/run/mpd/mpd.pid"|1' $pkgdir/etc/mpd.conf.example
	/bin/sed -i 's|#state_file.*$|state_file "/var/lib/mpd/mpdstate"|1' $pkgdir/etc/mpd.conf.example
	/bin/sed -i 's|#user.*$|user "mpd"|1' $pkgdir/etc/mpd.conf.example
}

