# Contributor: Lone_Wolf <lonewolf@xs4all.nl>
# Contributor: Marvn <mistrmarvn@gmail.com>

pkgname=fs2_open-inf-svn
pkgver=6379
pkgrel=1
pkgdesc="An enhancement of the original Freespace 2 engine, inferno build - SVN"
url="http://scp.indiegames.us"
arch=('i686' 'x86_64')
license=('custom:freespace2')
depends=('openal' 'libvorbis' 'sdl' 'mesa' 'libtheora' 'libpng' 'libjpeg' 'lua')
makedepends=('subversion')
install=fs2_open-svn.install
source=('fs2_open-svn.patch')
md5sums=('553b1d17d6486993f07e133813225626')

_svntrunk=svn://svn.icculus.org/fs2open/trunk/fs2_open
_svnmod=fs2_open

build()
{

  #Grab the sources with svn
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver) || return 1
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod || return 1
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  if [ -d $srcdir/$_svnmod-build ]; then
     rm -r $srcdir/$_svnmod-build
  fi
  cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
  cd $srcdir/$_svnmod-build

  #Patch and build the engine
  patch -Np0 -i $srcdir/fs2_open-svn.patch || return 1
 # patch -Np0 -i $srcdir/png14.patch || return 1
 # patch -p1 < $srcdir/new_sound.diff

  ./autogen.sh
  ./configure --enable-inferno
  make

  #Install the license
  install -D -m644 COPYING $pkgdir/usr/share/licenses/freespace2/COPYING 

  #Install the engine (The engine is compiled to one binary..)
  install -D -m755 code/fs2_open_INF_r $pkgdir/usr/bin/fs2_open_INF_r

}

# vim:set ts=2 sw=2 et:

