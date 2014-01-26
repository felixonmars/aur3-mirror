# Contributor: Arturo Martinez <arturembl(at)gmail.com>
#  Thanks to Stas Bourakov <sbourakov(at)gmail.com> for his work and support

pkgname=xine-lib_for_openpli-e2
pkgver=20120312
_commit='xine_1_2_1'
pkgrel=1
pkgdesc="Xine-lib, version, created only for the Enigma2-openPli project."
arch=('i686' 'x86_64')
url="https://github.com/nobody9/openpliPC/tree/master/xine-lib"
license=('GPL2')
depends=('gcc-libs' 'pulseaudio' 'ffmpeg-git')
makedepends=('git' 'make')
conflicts=(xine-lib_for_enigma2)

_gitroot='git://github.com/nobody9/openpliPC'
_gitname='enigma2'

build() {
    cd "${srcdir}"
    msg "Connecting to GIT server...."

    if [ -d "${_gitname}" ] ; then
        cd "${_gitname}" && git checkout "${_commit}" && git pull origin 
        [[ "${_commit}" ]] && git checkout "${_commit}"
        msg "The local files are updated."
    else
        git clone "${_gitroot}" "${_gitname}" -b "${_commit}"
        cd "${_gitname}"
        [[ "${_commit}" ]] && git checkout "${_commit}"
	fi

    if [ -d "$srcdir/$_gitname-build" ]; then
      rm -r "$srcdir/$_gitname-build"
    fi
    cp -r "$srcdir/$_gitname/xine-lib" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"
####
  ./autogen.sh --prefix=/usr \
               --disable-fb \
               --disable-vidix \
               --disable-dxr3 \
               --disable-sdl \
               --disable-xvmc \
               --disable-oss \
               --disable-syncfb \
               --disable-w32dll \
               --disable-musepack \
               --disable-samba \
               --disable-gdkpixbuf \
               --disable-modplug \
               --disable-real-codecs \
               --disable-gnomevfs \
               --disable-aalib \
               --disable-nosefart \
               --disable-modplug \
               --disable-vcd \
               --disable-vidix \
               --disable-xinerama \
               --disable-v4l \
               --disable-v4l2 \
               --disable-libv4l \
               --without-esound \
               --without-xcb \
               --without-imagemagick \
               --without-jack \
               --with-pulseaudio \
               --without-sdl \
               --without-speex \
               --without-wavpack \
               --without-caca \
               --disable-dvb \
               --enable-vdpau \
               --enable-vdr \
               --disable-dxr3 \
               --with-x \
               --with-alsa
               #--enable-debug
# if this xine-lib is too lean for you simply replace with:
# ./autogen.sh --disable-xinerama --disable-musepack --prefix=/usr 

      echo "build OpenPliPC xine-lib, please wait..."
    make || return 1
    make install DESTDIR=$pkgdir || return 1
}


