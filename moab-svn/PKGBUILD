# Contributor: Jed Brown <jed@59A2.org>
pkgname=(moab-svn)
pkgver=1832
pkgrel=2
pkgdesc="Mesh Oriented Database"
url="http://trac.mcs.anl.gov/projects/ITAPS/wiki/MOAB"
arch=('i686' 'x86_64')
license="LGPL"
depends=(openmpi hdf5 netcdf zoltan)
makedepends=()
provides=(moab)
conflicts=(moab)
replaces=()
backup=()
source=()
md5sums=()
options=(!libtool)

_svntrunk=https://svn.mcs.anl.gov/repos/ITAPS/MOAB/trunk
_svnmod=moab
_svnver=1832

build() {
  cd $startdir/src
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $_svnver)
  else
    svn co $_svntrunk --config-dir ./ -r $_svnver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  autoreconf -fi

  ./configure --prefix=/usr --enable-imesh --with-mpi --with-hdf5 --with-netcdf --with-zoltan=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
