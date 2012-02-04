# $Id: PKGBUILD 136027 2011-08-21 18:06:36Z ibiru $
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

# Modified By: Andrew Cook <ariscop@gmail.com>

pkgbase=mplayer
pkgname='mplayer-bluray'
pkgver=34007
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('libxxf86dga' 'libxxf86vm' 'libmad' 'cdparanoia' 'libxinerama' 'sdl' 'lame' 'libtheora' 'xvidcore' 'libmng' 'libxss' 'libgl' 'smbclient'
'aalib' 'jack' 'libcaca' 'x264' 'faac' 'faad2' 'lirc-utils'  'libxvmc' 'enca' 'libvdpau' 'opencore-amr' 'libdca' 'a52dec' 'schroedinger' 'libvpx'
'libpulse' 'fribidi' 'unzip' 'mesa' 'live-media' 'yasm' 'git' 'fontconfig' 'mpg123' 'ladspa' 'libass' 'libbluray')
license=('GPL')
url="http://www.mplayerhq.hu/"
options=(!buildflags !emptydirs)
source=(ftp://ftp.archlinux.org/other/mplayer/mplayer-${pkgver}.tar.xz mplayer.desktop)
md5sums=('675b929bab9e3540bb63207ed940fb7f'
         'c0d6ef795cf6de48e3b87ff7c23f0319')

build() {
    cd ${srcdir}/mplayer

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
        --enable-xvmc \
        --enable-bluray \
        --language=all \
        --confdir=/etc/mplayer
    [ "$CARCH" = "i686" ] &&  sed 's|-march=i486|-march=i686|g' -i config.mak

    make
}

package_mplayer-bluray() {
    pkgdesc="A movie player for linux, With bluray Suport"
    install=mplayer.install
    backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
    depends=('desktop-file-utils' 'ttf-dejavu' 'enca' 'libxss' 'a52dec' 'libvpx' 'lirc-utils' 'x264' 'libmng' 'libdca' 'aalib' 'lame' 'fontconfig'  'libgl'
    'libxinerama' 'libvdpau' 'libpulse' 'smbclient' 'xvidcore' 'opencore-amr' 'jack' 'cdparanoia' 'libmad' 'sdl' 'libtheora' 'libcaca' 'libxxf86dga' 'fribidi'
    'libjpeg' 'faac' 'faad2' 'libxvmc' 'schroedinger' 'mpg123' 'libass' 'libxxf86vm' 'libbluray')
    provides=('mplayer')
    conflics=('mplayer')

    cd ${srcdir}/${pkgbase}

    make DESTDIR=${pkgdir} install-mplayer  install-mplayer-man
    install -Dm644 etc/{codecs.conf,input.conf,example.conf} ${pkgdir}/etc/mplayer/
    install -dm755 ${pkgdir}/usr/share/mplayer/
    ln -s /usr/share/fonts/TTF/DejaVuSans.ttf ${pkgdir}/usr/share/mplayer/subfont.ttf
    rm -rf ${pkgdir}/usr/share/mplayer/font
    #desktop file  FS#14770
    install -Dm644 ${srcdir}/mplayer.desktop ${pkgdir}/usr/share/applications/mplayer.desktop
    install -Dm644 etc/mplayer.png ${pkgdir}/usr/share/pixmaps/mplayer.png
}
