# Packager: Nixtrian (nixtrian@gmail.com)
pkgname=mpd-fork-git
pkgver=20110901
pkgrel=1
pkgdesc="A fork of mpd with patches(id3v1)"
url="http://vi.appspot.com"
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
conflicts=('mpd' 'mpd-git')
provides=('mpd')
replaces=('mpd-svn')
install=mpd.install
source=('mpd.init' 'mpd.install')
md5sums=('b1fd15de359db08e4b9ae4b199640f0e'
         '332e0a4569ace3a5854070625a04f788')

_gitroot="git://github.com/azuwis/mpd.git"
_gitname="mpd"

build() {
    cd $srcdir

    msg "Connecting to GIT server..."

    if [ -d $srcdir/$_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    # Copy Latest files to Build Directory
    cp -r $srcdir/$_gitname $srcdir/$_gitname-build
    cd $srcdir/$_gitname-build

#patch -p1 <$srcdir/id3v1.patch
    # Configure Source
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-ao \
        --enable-bzip2 \
        --enable-iso9660 \
        --enable-lastfm \
        --enable-modplug \
        --enable-zip \
        --disable-jack \
        --disable-pulse \
        --with-zeroconf=no 
        #--enable-cue \
        #--enable-sqlite \
        #--enable-mms \
        #--enable-mvp \

    # Build Source
    make || return 1

    # Install Source
    make prefix=$pkgdir/usr install

    # Remove Build Directory
    rm -r $srcdir/$_gitname-build/

    # Create Directories
    install -d $pkgdir/var/{log/mpd,run/mpd,lib/mpd/playlists}

    # Install init Script
    install -D -m755 $srcdir/mpd.init \
        $pkgdir/etc/rc.d/mpd

#    # Install Sample Config
    install -D -m644 $srcdir/$_gitname/doc/mpdconf.example \
        $pkgdir/etc/mpd.conf.example

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

