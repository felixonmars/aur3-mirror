# Maintainer: Olaf Leidinger <oleid@mescharet.de> 

pkgname=osmand-core-git
pkgver=r0.g1d128a0
pkgrel=1
pkgdesc="Desktop build of osmand-core library"
arch=('i686' 'x86_64')
url="https://github.com/osmandapp/OsmAnd-core"
license=('GPL')
depends=('qt5-base qt5-tools')
makedepends=('git' 'patch')
options=('staticlibs') 

source=("core"::'git://github.com/osmandapp/OsmAnd-core.git'
	"build"::'git://github.com/osmandapp/OsmAnd-build.git'
        "resources"::'git://github.com/osmandapp/OsmAnd-resources.git'
        'build.patch'
)

md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '625dddafde62460dc94a06e3b6bfb607')


pkgver() {
  cd "$srcdir/core"
  # Use the tag of the last commit
  git describe --all --long | sed -E -e 's/([^-]*-g)/r\1/;s/-/./g' -e 's:heads/master.::g'
}

build() {
  ### apply patches
  cd "$srcdir/core" 
  patch -p1 < "$srcdir/build.patch"   ## submitted, remove when accepted upstream

  ### check out external dependencies
  cd "$srcdir/core/externals"

  ### remove unused dependencies
  rm -Rf qtbase-* boost-android
  ./configure.sh

  ### don't build wrappers
  cd "$srcdir/core" 
  cp /dev/null wrappers/wrappers.cmake

  ### misc iconv fixes
  cd "$srcdir/core/externals"
  for fn in libarchive/upstream.patched/libarchive/archive_string.c \
	    gdal/upstream.patched/port/cpl_recode_iconv.cpp
  do
  	sed -i 's:ICONV_CONST::g' ${fn}
  done

  ### make this resource findable by linking to the place,
  ### where they are searched
  for i in icu4c/upstream.patched/source/data/in/*; do
     dest=icu4c/upstream.data"/`basename ${i}`"

     if [ -f ${i} ] ; then 
        [ -f ${dest} ] || ln  ${i} ${dest}
     fi
  done

  ### fix hardcoded compiler version
  cd "$srcdir/build"
  sed -i 's:gcc-4.7:gcc:g' targets/*.cmake
  sed -i 's:g++-4.7:g++:g' targets/*.cmake

  ### use external library (if possible)
  export OSMAND_EXTERNAL_QT=1

  ### generate makefile
  if [[ $CARCH == "x86_64" ]]; then
     ./amd64-linux-gcc.sh
  else
     ./${CARCH}-linux-gcc.sh
  fi

  ### and build
  cd "$srcdir/baked/"* && make OsmAndCore_static
}

package() {
  dest=""$pkgdir"/opt/osmand"
  mkdir -p "$dest"/lib

  cp -ax "$srcdir/core/include"  "$dest"
  cp -ax "$srcdir/binaries/linux/"*/*.a  "$dest"/lib
}
