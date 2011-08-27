# Contributor: Zhou Xin <soul916@hotmail.com>
# Original from arch extra repo
# $Id: PKGBUILD 79976 2010-05-09 20:33:34Z ibiru $
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=mplayer-vdpau-svn
pkgver=33159
pkgrel=2
pkgdesc="A movie player for linux with Nvidia VDPAU support, based on extra/mplayer."
arch=('i686' 'x86_64')
depends=('libxxf86dga' 'libxxf86vm' 'libmad' 'cdparanoia' 'libxinerama' 'sdl' 'lame' 'libtheora' 'xvidcore' 'libmng' 'libxss'
         'libgl' 'smbclient' 'aalib' 'jack' 'libcaca' 'x264' 'faac' 'lirc-utils' 'ttf-dejavu' 'libxvmc' 'enca' 'libvdpau'
	 'opencore-amr' 'libdca' 'a52dec' 'schroedinger' 'libvpx' 'libpulse' 'fribidi' 'desktop-file-utils'
	 'nvidia')
license=('GPL')
url="http://www.mplayerhq.hu/"
makedepends=('unzip' 'mesa' 'live-media' 'yasm' 'git' 'subversion' 'nvidia' 'libvdpau')
install=mplayer.install
provides=("mplayer=${pkgver}-${pkgrel}")
conflicts=('mplayer')
replaces=('mplayer')
backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
source=(mplayer.desktop mplayer.png )
md5sums=('647b9f4ab5284a7fef3f84f992214e77'
         'd00874ccc644b7f43d6ef1c942fcef28')

_svntrunk=svn://svn.mplayerhq.hu/mplayer/trunk
_ffmpeggit=git://git.videolan.org/ffmpeg.git
_svnmod=mplayer-vdpau-svn

build() {
  # Custom CFLAGS break the mplayer build
  unset CFLAGS LDFLAGS

  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  if [[ -d $_svnmod/ffmpeg/.git ]] ; then
    (cd $_svnmod/ffmpeg && git pull)
  else
    git clone $_ffmpeggit $_svnmod/ffmpeg
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

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
      	--confdir=/etc/mplayer \
	--enable-vdpau || return 1

  [ "$CARCH" = "i686" ] &&  sed 's|-march=i486|-march=native|g' -i config.mak

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
