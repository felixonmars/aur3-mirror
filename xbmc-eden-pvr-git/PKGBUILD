#
# Maintainer: Jeremy Skippen < jeremy DOT skippen AT gmail DOT com >
#
# Shameless merge of community-testing/xbmc and xbmc-eden-git
#
# Original credits:
#  Sergej Pupykin and other contributors to XBMC in community
#  BlackIkeEagle -- xbmc-eden-git aur package ( https://aur.archlinux.org/packages/xb/xbmc-eden-git/PKGBUILD )
#

pkgname=xbmc-eden-pvr-git
pkgver=20121125
pkgrel=1
pkgdesc="XBMC Media Center - Eden PVR branch"
provides=('xbmc')
conflicts=(
	'xbmc' 'xbmc-pulse' 'xbmc-svn' 'xbmc-git' 'xbmc-eden-git' 'xbmc-pvr-git'
)
arch=('i686' 'x86_64')
url="http://xbmc.org"
license=('GPL' 'LGPL')
depends=(
	'libpulse' 'hicolor-icon-theme' 'fribidi' 'lzo2' 'smbclient' 'libtiff'
	'libva' 'libpng' 'libcdio' 'yajl' 'libmysqlclient' 'libjpeg-turbo'
	'libsamplerate' 'glew' 'libssh' 'libmicrohttpd' 'libxrandr' 'sdl_mixer'
	'sdl_image' 'python2' 'libass' 'libmpeg2' 'libmad' 'libmodplug' 'jasper'
	'rtmpdump' 'unzip' 'mesa-demos' 'xorg-xdpyinfo' 'libbluray' 'libnfs'
	'afpfs-ng' 'libshairport' 'avahi' 'bluez' 'tinyxml'
)
makedepends=(
	'boost' 'cmake' 'git' 'gperf' 'nasm' 'libxinerama' 'zip' 'libva-vdpau-driver'
	'libcec' 'udisks' 'upower' 'mesa'
)

optdepends=(
	'gdb: for meaningful backtraces in case of trouble - STRONGLY RECOMMENDED'
	'libcrystalhd: Broadcom CrystalHD kernel module'
	'libcec: support for Pulse-Eight USB-CEC adapter'
	'libva-vdpau-driver: accelerated video playback for nvidia cards'
	'libva-intel-driver: accelerated video playback for Intel G45 chipsets and Intel HD Graphics'
#	'xvba-video: accelerated video playback for amd cards'
	'pulseaudio: pulseaudio support'
	'lirc: remote controller support'
	'udisks: automount external drives'
	'upower: used to trigger suspend functionality'
	'unrar: access compressed files without unpacking them'
)
install="$pkgname.install"
source=()
sha256sums=()

_prefix='/usr'

if [ -e .githash_$CARCH ] ; then
	_gitphash=$(cat .githash_$CARCH)
else
	_gitphash=""
fi

_gitname='xbmc'
_gitroot='https://github.com/opdenkamp/xbmc.git'
_gitbranch='Eden-pvr'

build()
{
	if [ -d "$srcdir/$_gitname/.git" ] ; then
		( cd "$srcdir/$_gitname" && git pull origin $_gitbranch )
		msg "The local files are updated."
	else
		( git clone -b $_gitbranch --depth 1  $_gitroot $_gitname )
	fi
	msg "GIT checkout done or server timeout"

	cd $_gitname
	if [ "$_gitphash" = "$(git show | grep -m 1 commit | sed 's/commit //')" ]
	then
		msg "Git hash is the same as previous build"
		return 1
	fi

	msg "creating build directory"
	cd "$srcdir"
	[ -d $_gitname-build ] && rm -rf $_gitname-build
	cp -a $_gitname $_gitname-build

	msg "Starting make..."
	cd $_gitname-build

	# fix lsb_release dependency
	sed -i -e 's:/usr/bin/lsb_release -d:cat /etc/arch-release:' \
		xbmc/utils/SystemInfo.cpp

	msg2 "Bootstrapping XBMC"
	./bootstrap

	msg2 "Configuring XBMC"
	export PYTHON_VERSION=2  # external python v2
	./configure --prefix=$_prefix --exec-prefix=$_prefix \
		--enable-debug \
		--enable-optimizations \
		--enable-gl \
		--enable-sdl \
		--enable-vaapi \
		--enable-vdpau \
		--enable-xvba \
		--enable-joystick \
		--enable-xrandr \
		--enable-rsxs \
		--enable-projectm \
		--enable-x11 \
		--enable-pulse \
		--enable-rtmp \
		--enable-samba \
		--enable-nfs \
		--enable-afpclient \
		--enable-airplay \
		--enable-airtunes \
		--enable-ffmpeg-libvorbis \
		--enable-dvdcss \
		--disable-hal \
		--enable-avahi \
		--enable-webserver \
		--enable-optical-drive \
		--enable-libbluray \
		--enable-texturepacker \
		--enable-udev \
		--enable-libusb \
		--enable-libcec \
		--enable-external-libraries \
		--disable-external-ffmpeg

	# Now (finally) build
	msg2 "Running make"
	make
}

package()
{
	cd "${srcdir}/${_gitname}-build"

	# Running make install
	msg2 "Running make install"
	make DESTDIR="${pkgdir}" install

	# run feh with python2
	sed -i -e 's/python/python2/g' ${pkgdir}${_prefix}/bin/xbmc

	# Tools
	msg2 "Tools"
	install -Dm755 $srcdir/$_gitname-build/tools/TexturePacker/TexturePacker \
		${pkgdir}${_prefix}/lib/xbmc/

	# Licenses
	install -d -m 0755 "${pkgdir}${_prefix}/share/licenses/${pkgname}"
	for licensef in LICENSE.GPL copying.txt; do
		mv "${pkgdir}${_prefix}/share/doc/xbmc/${licensef}" \
			"${pkgdir}${_prefix}/share/licenses/${pkgname}"
	done

	git show | grep -m 1 commit | sed 's/commit //' > $startdir/.githash_$CARCH
}

