# Contributor: Nikhilesh S (nikki) <s.nikhilesh@gmail.com>

pkgname=ogreal-svn
pkgver=137
pkgrel=1
pkgdesc="An OpenAL wrapper for the Ogre Rendering Engine (with patch for 'buffer queue' problem)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ogreal/"
license=('LGPL2')
depends=('ogre' 'gtk2' 'openal' 'libvorbis' 'libxaw')
makedepends=('svn' 'autoconf' 'automake' 'pkgconfig>=0.9' 'libtool' 'boost')
provides=('ogreal')
conflicts=('ogreal')
options=('!libtool')
source=('patch.patch')
md5sums=('da5078703a6a4c58aaf6f1953e730e41')

_svntrunk=http://ogreal.svn.sourceforge.net/svnroot/ogreal/trunk/OgreAL-Eihort
_svnmod=ogreal

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod
    svn up -r $pkgver
    cd ..
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  rm -rf $_svnmod-build
  cp -rf $_svnmod/ $_svnmod-build/
  cd $_svnmod-build/

  patch -p0 -i $startdir/patch.patch

  msg "Starting make..."

  touch NEWS AUTHORS ChangeLog
  autoreconf -i
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}

