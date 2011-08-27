# Maintainer: catwell <catwell@archlinux.us>
# Contributor: Army <uli[dot]armbruster[at]gmail[dot].com>

pkgname=mplayer-svn-wmapro
pkgver=29378
pkgrel=1
pkgdesc="Famous multimedia player, dev. version, with wmapro support"
arch=('i686' 'x86_64')
url="http://www.mplayerhq.hu/"
license=('GPL')
depends=('ttf-dejavu')
makedepends=('subversion')
conflicts=('mplayer')
provides=('mplayer')
source=()
md5sums=()

_svnmod="mplayer"
_svntrunk=svn://svn.mplayerhq.hu/mplayer/trunk/

build() {

  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod
    svn up -r $pkgver
  else
    svn co $_svntrunk --config-dir . -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"

  cd $srcdir
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  svn checkout svn://svn.ffmpeg.org/soc/wmapro wmapro
  cp wmapro/wma* libavcodec
  patch -p0 <wmapro/audioframesize.patch
  patch -p0 <wmapro/mplayer.patch
  patch -p0 <wmapro/wmapro_ffmpeg.patch

  cp -v wmapro/wma3dec.c wmapro/wma3data.h wmapro/wma3.h libavcodec

  msg "Building the package..."
  unset CFLAGS

    ./configure --prefix=/usr --confdir=/etc/mplayer \
  		--language=all || return 1

  make || return 1
  make DESTDIR=$pkgdir install || return 1

  install -m0644 etc/{codecs.conf,input.conf,example.conf} $pkgdir/etc/mplayer
  install -d $pkgdir/usr/share/mplayer/
  ln -s /usr/share/fonts/TTF/DejaVuSans.ttf $pkgdir/usr/share/mplayer/subfont.ttf

  msg "Cleaning build files..."
  rm -rf $srcdir/$_svnmod-build

}
