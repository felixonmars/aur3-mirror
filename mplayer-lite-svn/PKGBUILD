# Maintainer : ksj <podhorsky.ksj@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=mplayer-lite-svn
pkgver=36817
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A movie player for linux"
install='mplayer.install'
backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
depends=('xvidcore' 'libxinerama' 'libxss' 'libcaca' 'libxvmc'
        'libpulse' 'jack' 'libxxf86dga' 'faad2' 'rtmpdump' 'opus'
        'mesa' 'libass' 'lirc-utils' 'faac' 'gsm' 'libmng' 'libvpx'
        'sdl' 'libcdio-paranoia' 'libbluray' 'desktop-file-utils'
        'a52dec' 'x264' 'aalib' 'libtheora' 'opencore-amr' 'libdca'
        'mpg123' 'lame' 'schroedinger' 'libmad')

makedepends=('mesa' 'yasm' 'git')# 'ladspa'
license=('GPL')
conflicts=('mplayer' 'mplayer-svn')
provides=('mplayer')
url='http://www.mplayerhq.hu/'
options=('!buildflags' '!emptydirs')
source=(svn://svn.mplayerhq.hu/mplayer/trunk
        http://ffmpeg.org/releases/ffmpeg-2.1.tar.bz2
        mplayer.desktop
        cdio-includes.patch)
md5sums=('SKIP'
         '4ec1cedd4c7753512462f70b347c338a'
         '62f44a58f072b2b1a3c3d3e4976d64b3'
         '7b5be7191aafbea64218dc4916343bbc')

pkgver() {
  cd trunk
  svnversion
}

prepare() {
    cd trunk
    patch -p0 -i ../cdio-includes.patch

    mv ../ffmpeg-2.1 ./ffmpeg
}

build() {
    cd trunk

    ./configure --prefix=/usr \
        --enable-runtime-cpudetection \
        --disable-gui \
        --disable-arts \
        --disable-liblzo \
        --disable-speex \
        --disable-openal \
        --disable-libdv \
        --disable-musepack \
        --disable-esd \
        --disable-mga \
        --disable-ass-internal \
        --disable-cdparanoia \
        --enable-xvmc \
        --language=all \
        --disable-smb \
        --confdir=/etc/mplayer 
    [[ "$CARCH" = "i686" ]] &&  sed 's|-march=i486|-march=i686|g' -i config.mak

    make
}

package() {
    cd trunk
    make DESTDIR="$pkgdir" install-mplayer install-mplayer-man

    install -Dm644 etc/{codecs.conf,input.conf,example.conf} "$pkgdir/etc/mplayer/"
    install -Dm644 "$srcdir/mplayer.desktop" "$pkgdir/usr/share/applications/mplayer.desktop"
    install -Dm644 etc/mplayer256x256.png "$pkgdir/usr/share/pixmaps/mplayer.png"
}
