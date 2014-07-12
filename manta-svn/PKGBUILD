# Maintainer: Dave Reisner <d@falconindy.com> 
# Contributor: William Giokas (KaiSforza) <1007380@gmail.com>

pkgname=manta-svn
pkgver=r2542 
pkgrel=2
pkgdesc="a highly portable interactive ray tracing environment"
arch=('i686' 'x86_64')
url="http://mantawiki.sci.utah.edu/manta/Main_Page"
license=('MIT')
depends=('openmpi' 'libx11' 'zlib' 'libgl' 'imagemagick' 'openexr')
optdepends=()
makedepends=('subversion' 'cmake')
conflicts=()
provides=('manta')
source=('all.patch')
md5sums=('dd1faa5da3ec84a3db574ca7fe496f50')

prepare() {
#  svn checkout http://anonymous@gforge.sci.utah.edu/svn/Manta/trunk $pkgname
  svn checkout --username anonymous --password '' http://gforge.sci.utah.edu/svn/Manta/trunk $pkgname
}

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$pkgname"
  patch -p1 -N < "$srcdir/all.patch"
  cd "$srcdir"
  [[ -d ${pkgname}-build ]] && rm -r ${pkgname}-build
  mkdir ${pkgname}-build
  cd ${pkgname}-build
  cmake \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_C_COMPILER=mpicc \
    -DCMAKE_CXX_COMPILER=mpicxx \
    -DENABLE_MPI:BOOL=ON \
    ../$pkgname
#    -DMANTA_USE_DYNBVH_APPROXIMATE:BOOL=ON \
  make
}

package() {
  cd "$srcdir/${pkgname}-build"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/include/.svn"
}
