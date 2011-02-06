# Maintainer: Hans-Kristian Arntzen <maister@archlinux.us>

pkgname=mplayer-rsound-svn
pkgver=32628
pkgrel=1
pkgdesc="A movie player for linux with RSound support"
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
         'x264>=20090925'
         'faac'
         'ttf-dejavu')
license=('GPL2')
url="http://www.mplayerhq.hu/"
depends=('rsound')
makedepends=('subversion' 'pkgconfig')
backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
conflicts=('mplayer')
provides=("mplayer=$pkgver")
source=('mplayer-rsound.patch')
md5sums=('89b1a3bed575385bae35869e6b347348')

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

  cp -urT $_svnmod/ $_svnmod-build

  cd $_svnmod-build

  # Apply patch
  patch -p1 < $srcdir/mplayer-rsound.patch || return 1

  unset CFLAGS LDFLAGS
  
  ./configure --prefix=/usr --confdir=/etc/mplayer --disable-gl --language=all || return 1

  [ "$CARCH" = "i686" ] &&  sed 's|-march=i486|-march=i686|g' -i config.mak


  msg "Starting make..."

  make || return 1

  make -j1 DESTDIR=${pkgdir} install || return 1
  install -D -m644 etc/{codecs.conf,input.conf,example.conf} ${pkgdir}/etc/mplayer/ || return 1
  install -d -m755 ${pkgdir}/usr/share/mplayer/
  ln -s /usr/share/fonts/TTF/DejaVuSans.ttf ${pkgdir}/usr/share/mplayer/subfont.ttf || return 1
  rm -rf ${pkgdir}/usr/share/mplayer/font
}
