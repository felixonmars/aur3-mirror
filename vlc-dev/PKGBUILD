# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=vlc-dev
pkgver=2.1.0.git.56.gb508b08
pkgrel=1
pkgdesc="VLC minus uncommon modules plus love (git version)"
arch=('i686' 'x86_64')
url='http://www.videolan.org/vlc/'
license=('GPL2')
depends=('qt4' 'mesa' 'libxv' 'libass' 'xcb-util-keysyms' 'ncurses' 'ffmpeg' 'libxml2')
makedepends=('qt4' 'mesa' 'libxv' 'libass' 'xcb-util-keysyms' 'ncurses' 'ffmpeg' 'libxml2')
conflicts=('vlc')
provides=('vlc')
source=("git://git.videolan.org/vlc/vlc-2.1.git")
md5sums=('SKIP')

_gitroot="vlc-2.1"

pkgver () {
    cd "$srcdir/$_gitroot"
    git describe --always | sed 's|-|.|g' 
}

build() {
    cd "$srcdir/$_gitroot"
    ./bootstrap

    #disable all auto and default enabled modules that i dont need
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --disable-nls \
        --disable-rpath \
        --disable-non-utf8 \
        --disable-dbus-control \
        --disable-telepathy \
        --disable-debug \
        --disable-gprof \
        --disable-cprof \
        --disable-coverage \
        --disable-neon \
        --disable-altivec \
        --disable-run-as-root \
        --disable-sout \
        --disable-lua \
        --disable-httpd \
        --disable-vlm \
        --disable-libproxy \
        --disable-live555 \
        --disable-dc1394 \
        --disable-dv \
        --disable-linsys \
        --disable-dshow \
        --disable-bluray \
        --disable-opencv \
        --disable-smb \
        --disable-sftp \
        --disable-v4l2 \
        --disable-pvr \
        --disable-decklink \
        --disable-gnomevfs \
        --disable-vcdx \
        --disable-vcd \
        --disable-libcddb \
        --disable-screen \
        --disable-realrtsp \
        --disable-macosx-eyetv \
        --disable-macosx-qtkit \
        --disable-dvbpsi \
        --disable-gme \
        --disable-sid \
        --disable-ogg \
        --disable-mux_ogg \
        --disable-shout \
        --disable-mkv \
        --disable-mod \
        --disable-mpc \
        --disable-wma-fixed \
        --disable-shine \
        --disable-omxil \
        --disable-iomx \
        --disable-crystalhd \
        --disable-mad \
        --disable-dxva2 \
        --disable-switcher \
        --disable-postproc \
        --disable-faad \
        --disable-twolame \
        --disable-quicktime \
        --disable-real \
        --disable-a52 \
        --disable-dca \
        --disable-flac \
        --disable-libmpeg2 \
        --disable-vorbis \
        --disable-tremor \
        --disable-speex \
        --disable-opus \
        --disable-theora \
        --disable-dirac \
        --disable-schroedinger \
        --disable-png \
        --disable-fluidsynth \
        --disable-zvbi \
        --disable-telx \
        --disable-kate \
        --disable-tiger \
        --disable-egl \
        --disable-macosx-vout \
        --disable-fribidi \
        --disable-macosx-quartztext \
        --disable-svg \
        --disable-android-surface \
        --disable-ios-vout \
        --disable-directx \
        --disable-direct2d \
        --disable-wingdi \
        --disable-directfb \
        --disable-aa \
        --disable-caca \
        --disable-kva \
        --disable-pulse \
        --disable-oss \
        --disable-portaudio \
        --disable-waveout \
        --disable-macosx-audio \
        --disable-audioqueue \
        --disable-jack \
        --disable-opensles \
        --disable-samplerate \
        --disable-kai \
        --disable-skins2 \
        --disable-libtar \
        --disable-hildon \
        --disable-macosx \
        --disable-macosx-dialog-provider \
        --disable-xosd \
        --disable-fbosd \
        --disable-lirc \
        --disable-visual \
        --disable-goom \
        --disable-projectm \
        --disable-atmo \
        --disable-bonjour \
        --disable-mtp \
        --disable-upnp \
        --disable-libgcrypt \
        --disable-gnutls \
        --disable-taglib \
        --disable-update-check \
        --disable-growl \
        --disable-notify \
        --disable-media-library \
        --disable-sqlite \
        --disable-loader \
        --disable-macosx-vlc-app \
        --disable-smbclient \
        --disable-libvnc \
        --disable-libfreerdp \
        RCC=/usr/bin/rcc-qt4
    make
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

