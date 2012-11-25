# Contributor: Guillem Rieu <guillemr@gmx.net>
pkgname=gccxml-cvs
pkgver=20121105
pkgrel=1
pkgdesc="GCC-XML generates an XML description of a C++ program from GCC's internal representation"
arch=(i686 x86_64)
url="http://www.gccxml.org/"
license=('custom')
depends=()
makedepends=('cvs' 'cmake')
provides=('gccxml')
conflicts=('gccxml')
source=(Copyright.txt gccxml-swap.patch)
md5sums=('2f8b08b32c8c0812ddd083d1bee15091' 'f227de2576a002af55d1e7144889ce45')

_cvsroot=":pserver:anoncvs:@www.gccxml.org:/cvsroot/GCC_XML"
_cvsmod="gccxml"

build() {
  cd $startdir/src/

  msg "Connecting to $_cvsmod CVS server..."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -dP -D $pkgver || return 1
    cd ..
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod || return 1
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  # Apply patch 
  # http://public.kitware.com/Bug/bug_relationship_graph.php?bug_id=13430
  cd $_cvsmod
  patch -p1 -i $srcdir/gccxml-swap.patch
  cd ..

  mkdir $_cvsmod-build
  cd $_cvsmod-build
  cmake ../$_cvsmod -DCMAKE_INSTALL_PREFIX:PATH=/usr || return 1
  make || return 1
  make DESTDIR="$startdir/pkg" install || return 1

  install -D -m644 ../Copyright.txt $startdir/pkg/usr/share/licenses/$pkgname/Copyright.txt || return 1

  rm -r $startdir/src/$_cvsmod-build
}

# vim:set ts=2 sw=2 et:
