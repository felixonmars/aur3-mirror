# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=crystalspace-1.4branch-svn
pkgver=32140
pkgrel=1
pkgdesc="free and portable 3D Game Development Kit written in C++, a specific revision for planeshift-svn"
url="http://www.crystalspace3d.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('cal3d-svn' 'libjpeg' 'curl' 'libmng' 'libmikmod' 'libvorbis' 'libpng' 'openal' 'freetype2' 'mesa')
makedepends=('ftjam' 'subversion')
conflicts=('crystalspace')
source=()     
md5sums=('')

_svntrunk=https://crystal.svn.sourceforge.net/svnroot/crystal/CS/branches/release/V1.4
_svnmod=crystalspace

build() {

  #Grab the sources with svn
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver) || return 1
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod || return 1
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  rm -r $srcdir/$_svnmod-build
  cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
  cd $srcdir/$_svnmod-build
  
  #Build and install the package
  ./configure --without-java --without-perl --without-python --without-lib3ds --prefix=/usr --sysconfdir=/etc --enable-separate-debug-info=no --with-cal3d
  jam -q libs plugins cs-config walktest || return 1
  jam DESTDIR=$pkgdir install

}

# vim:set ts=2 sw=2 et:
