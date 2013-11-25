# Submitter:   Wessel Dirksen "p-we" <wdirksen at gmail dot com>
# Contributor: Tycho Lürsen "bas-t" - hosting mirror of mythtv-git with modified mythtv branches
# Contributor: vaca - some code borrowed from mythtv-git AUR

# Specify whether to use bas-t modified or official packages from MythTV git repo
_bas_t_mods=yes

# Specify which version MythTV (syntax=0.xx)
# MythTV Official: 0.18 through latest - currently 0.27
# Bas-t modified: 0.26 and 0.27
_mythtv=0.27

pkgname=mythtv-git-bas-t
pkgver=0.xx
pkgrel=1
pkgdesc="MythTV-git, with modifications from Tycho Lürsen "bas-t" (optional)"
arch=('i686' 'x86_64')
url="http://www.mythtv.org/"
license=('GPL')
depends=('avahi' 'fftw' 'libass' 'libcdio' 'lame' 'libavc1394' 'libiec61883' 'libvdpau'
	 'libxinerama' 'libxvmc' 'sdl' 'lirc-utils' 'mesa' 'mariadb-clients' 'mysql-python'
	 'perl-dbd-mysql' 'perl-libwww' 'perl-net-upnp' 'perl-io-socket-inet6' 'openssl'
	 'perl-socket6' 'python2-lxml' 'urlgrabber' 'qt4' 'wget' 'yasm' 'x264' 'qtwebkit'
	 'alsa-utils' 'faac' 'xvidcore' 'libvpx' 'ffmpeg' 'libva' 'glew' 'libvorbis' 'libpulse'
	 'libmpeg2' 'libmp4v2' 'libsamplerate' 'libmad' 'jasper' 'python2-pycurl' 'taglib'
	 'libxml2' 'libcec')
makedepends=('git' 'yasm')
optdepends=('xmltv' 'mariadb')
replaces=('mythtv-contrib' 'mythtv')
conflicts=('mythtv-contrib' 'mythtv')
provide=('mythtv')
backup=('usr/lib/systemd/system/mythbackend.service')
install='mythtv.install'

	if [ $_bas_t_mods == "yes" ]; then
		_branch="stable/$_mythtv"
	else
		_branch="fixes/$_mythtv"
	fi

source=("git://github.com/bas-t/mythtv.git#branch=$_branch"
	'mythbackend.service'
	'mythfrontend.desktop')

sha256sums=('SKIP'
            '5232a6fe13688b2154e4aa6b68a47410de7b7cd90be3b9efed810799c30734a4'
            'b8a4297389d04fee2fbac07c43ed144a31737ebca2d450d39493e177e1db36db')

pkgver() {

	cd $srcdir/mythtv
 	echo `git describe --always | sed 's|-|.|g'`
}

build() {

cd $srcdir/mythtv/mythtv
find 'bindings/python' 'contrib' -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

./configure	--compile-type=profile		--enable-runtime-cpudetect \
		--prefix=/usr			--runprefix=/usr \
              	--enable-mmx            	--disable-audio-oss \
              	--enable-audio-alsa            	--disable-audio-jack \
              	--enable-audio-pulse          	--disable-altivec \
              	--disable-distcc              	--disable-ccache \
              	--enable-crystalhd		--enable-hdpvr \
              	--enable-vaapi              	--enable-dxva2 \
              	--enable-vdpau              	--enable-dvb \
              	--dvb-path=/usr/include        	--enable-lirc \
              	--enable-joystick-menu		--enable-libvpx \
		--enable-libfaac		--enable-libxvid \
		--enable-nonfree		--enable-opengl-video \
              	--enable-ivtv              	--enable-firewire \
              	--enable-xrandr              	--enable-libxvid \
		--enable-ffmpeg-pthreads	--enable-pic \
	      	--enable-libx264	      	--enable-libmp3lame \
		--enable-libfftw3		--enable-sdl \
		--python=python2	      	--qmake=qmake4 \
              	--enable-proc-opt		--with-bindings=perl,python,php \
		--perl-config-opts="INSTALLDIRS=vendor"

make
}

package() {

cd $srcdir/mythtv/mythtv
make INSTALL_ROOT="$pkgdir" install

install -D -m644 'database/mc.sql' "$pkgdir/usr/share/mythtv/mc.sql"
install -D -m644 "$srcdir/mythbackend.service" "$pkgdir/usr/lib/systemd/system/mythbackend.service"
install -D -m644 "$srcdir/mythfrontend.desktop" "$pkgdir/usr/share/applications/mythfrontend.desktop"

mkdir -p "$pkgdir/var/log/mythtv"
mkdir -p "$pkgdir/usr/share/mythtv"
cp -R 'contrib' "$pkgdir/usr/share/mythtv"
}
