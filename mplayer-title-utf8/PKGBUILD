# Maintainer : Jekyll Wu <adaptee [at] gmail [dot] com>

pkgname=mplayer-title-utf8
_pkgname=mplayer
pkgver=33713
pkgrel=1
pkgdesc="A movie player for linux, patched for showing UTF-8 filename nicely as window title"
arch=('i686' 'x86_64')
depends=('libxxf86dga' 'libxxf86vm' 'libmad' 'cdparanoia' 'libxinerama' 'sdl' 'lame' 'libtheora' 'xvidcore' 'libmng' 'libxss'
         'libgl' 'smbclient' 'aalib' 'jack' 'libcaca' 'x264' 'faac' 'lirc-utils' 'ttf-dejavu' 'libxvmc' 'enca' 'libvdpau'
         'opencore-amr' 'libdca' 'a52dec' 'schroedinger' 'libvpx' 'libpulse' 'fribidi' 'desktop-file-utils')
license=('GPL')
url="http://www.mplayerhq.hu/"
makedepends=('unzip' 'mesa' 'live-media' 'yasm' 'git')
provides=( 'mplayer')
conflicts=( 'mplayer' 'mplayer-svn')
install=mplayer.install
backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
source=(ftp://ftp.archlinux.org/other/${_pkgname}/${_pkgname}-${pkgver}.tar.xz
        mplayer.desktop
        mplayer.png
        title-utf8.patch
        )
md5sums=('caedcdc1e50b5575c38c2a85f9c53afc'
         '647b9f4ab5284a7fef3f84f992214e77'
         'd00874ccc644b7f43d6ef1c942fcef28'
         '53ea02cf1f39b66d233dedae498cd32b')
build() {
  # Custom CFLAGS break the mplayer build
  unset CFLAGS LDFLAGS

  cd ${srcdir}/${_pkgname}

  patch -p1 < ../title-utf8.patch

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
      --enable-xvmc \
      --language=all \
      --confdir=/etc/mplayer

  [ "$CARCH" = "i686" ] &&  sed 's|-march=i486|-march=i686|g' -i config.mak

  make
  make -j1 DESTDIR=${pkgdir} install
  install -Dm644 etc/{codecs.conf,input.conf,example.conf} ${pkgdir}/etc/mplayer/
  install -dm755 ${pkgdir}/usr/share/mplayer/
  ln -s /usr/share/fonts/TTF/DejaVuSans.ttf ${pkgdir}/usr/share/mplayer/subfont.ttf
  rm -rf ${pkgdir}/usr/share/mplayer/font
  #desktop file  FS#14770
  install -Dm644 ${srcdir}/mplayer.desktop ${pkgdir}/usr/share/applications/mplayer.desktop
  install -Dm644 ${srcdir}/mplayer.png ${pkgdir}/usr/share/pixmaps/mplayer.png
}

md5sums=('1c114ba8cb932ec75f5d94d3722221fa'
         '647b9f4ab5284a7fef3f84f992214e77'
         'd00874ccc644b7f43d6ef1c942fcef28'
         '53ea02cf1f39b66d233dedae498cd32b')
