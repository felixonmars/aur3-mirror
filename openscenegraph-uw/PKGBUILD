# Contributor Paolo Giangrandi <peoro@luccalug.it>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=openscenegraph-uw
pkgver=1.2.0
pkgrel=2
pkgdesc="An Open Source, high performance real-time graphics toolkit modified by Underware"
url="http://www.openscenegraph.org"
arch=('i686')
license=("LGPL" "custom")
depends=('libtiff' 'libpng' 'mesa')
provides=('openscenegraph' 'openproducer' 'openthreads')
conflicts=('openscenegraph' 'openproducer' 'openthreads')
source=(http://download.gna.org/underware/sources/openscenegraph-$pkgver.tar.gz \
        http://poker3d-gentoo.googlecode.com/svn/trunk/dev-cpp/openscenegraph/files/01.dpatch)
md5sums=('875b7fad523fc5f3a789c29ae156dc60' '51e42411b2b88bede8a26a41e22aba63')

build() {
  cd $startdir/src/openscenegraph-$pkgver
  patch -Np1 -i ../01.dpatch
  export LIBUNGIF_INSTALLED=no 
  export GLUT_INSTALLED=yes 
  export COMPILE_EXAMPLES=no
  export COMPILE_OSG_OP_OT_WITH_SONAMES=YES
  export OPENTHREADS_INC_DIR=$startdir/src/openscenegraph-$pkgver/OpenThreads/include
  export OPENTHREADS_LIB_DIR=$startdir/src/openscenegraph-$pkgver/OpenThreads/lib/Linux
  export PRODUCER_INC_DIR=$startdir/src/openscenegraph-$pkgver/Producer/include
  export PRODUCER_LIB_DIR=$startdir/src/openscenegraph-$pkgver/Producer/lib/Linux
  export INST_LOCATION="$startdir/pkg/usr"
  export CXXFLAGS="${CXXFLAGS} -include cstring -include cstdlib -include iostream -include memory -include cstdio"
  cd $startdir/src/openscenegraph-$pkgver/OpenThreads
  make ARCH='' OPTF="'${CXXFLAGS}'" || return 1
  cd $startdir/src/openscenegraph-$pkgver/Producer
  make ARCH='' OPTF="'${CXXFLAGS}'" || return 1
  cd $startdir/src/openscenegraph-$pkgver/OpenSceneGraph
  make ARCH='' OPTF="'${CXXFLAGS}'" || return 1

  cd $startdir/src/openscenegraph-$pkgver/OpenThreads
  make ARCH='' install || return 1
  install -D Make/openthreads.pc $startdir/pkg/usr/lib/pkgconfig/openthreads.pc
  cd $startdir/src/openscenegraph-$pkgver/Producer
  make ARCH='' install || return 1
  install -D Make/producer.pc $startdir/pkg/usr/lib/pkgconfig/producer.pc
  cd $startdir/src/openscenegraph-$pkgver/OpenSceneGraph
  make ARCH='' install || return 1
  install -D Make/openscenegraph.pc $startdir/pkg/usr/lib/pkgconfig/openscenegraph.pc
  mv $startdir/pkg/usr/share/OpenSceneGraph/bin $startdir/pkg/usr
  rm -r $startdir/pkg/usr/share
  install -D -m 644 LICENSE.txt $startdir/pkg/usr/share/licenses/$pkgname/LICENSE.txt
}
