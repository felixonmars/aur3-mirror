# Contributor: Krey Zoll <kreyzoll(at)gmail.com>
# this is mod of mplayer-svn package made by crank: http://aur.archlinux.org/packages.php?ID=24405
pkgname=mplayer-svn-gui
pkgver=29952
pkgrel=1
pkgdesc="A movie player for linux"
arch=('i686' 'x86_64')
depends=('libdvdnav'
	 'libxxf86dga'
	 'libxv'
	 'libmad'
	 'giflib'
	 'cdparanoia'
	 'lame'
	 'libtheora'
	 'xvidcore'
	 'zlib'
	 'libmng'
         'x264'
	 'faac'
	 'ttf-dejavu'
	 'aalib'
	 'gtk2'
	 'libcaca'
	 'libgl'
	 'libjpeg'
	 'libmng'
	 'libxss'
	 'smbclient')
license=('GPL2')
url="http://www.mplayerhq.hu/"
makedepends=('subversion' 'pkgconfig')
backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
conflicts=('mplayer')
provides=("mplayer=$pkgver")
install=("mplayer-svn.install")
source=('configure-copy-disabled-features.patch' 'configure-fribidi-0.19.2.patch' 'clearplayer-0.9.tar.bz2')
md5sums=('cf0cd88707ebc7cd7d7a1a9b2eed8943' '9b34d445e29054d555266f5c56c68bd2' 'df5fd8e51fbc077ddc7b74d83afe1452')

_svntrunk=svn://svn.mplayerhq.hu/mplayer/trunk
_svnmod=mplayer

build() {

  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver && cd ..)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg "SVN checkout done or server timeout, updating build dir"

  cp -ur $_svnmod/ $_svnmod-build

  cd $_svnmod-build

  # Apply some patches
  for patch in ../*.patch; do
	  msg "Applying $patch..."
	  patch -Np1 -i ../$patch
  done

  unset CFLAGS LDFLAGS
  
  ./configure --prefix=/usr --enable-runtime-cpudetection --enable-gui --disable-arts \
      --confdir=/etc/mplayer --disable-liblzo --disable-speex \
      --disable-openal --disable-libdv --disable-musepack \
      --language=all --disable-esd --disable-mga --disable-pulse --extra-cflags=-fno-strict-aliasing || return 1

  [ "$CARCH" = "i686" ] &&  sed 's|-march=i486|-march=i686|g' -i config.mak

  make || return 1
  make -j1 DESTDIR=${pkgdir} install || return 1
  install -Dm644 etc/{codecs.conf,input.conf,example.conf} ${pkgdir}/etc/mplayer/ || return 1
  install -dm755 ${pkgdir}/usr/share/mplayer/
  tar xvjf ${srcdir}/clearplayer-0.9.tar.bz2 -C ${pkgdir}/usr/share/mplayer/skins
  cd ${pkgdir}/usr/share/mplayer/skins/
  ln -s clearplayer default
  ln -s /usr/share/fonts/TTF/DejaVuSans.ttf ${pkgdir}/usr/share/mplayer/subfont.ttf || return 1
  rm -rf ${pkgdir}/usr/share/mplayer/font
}
