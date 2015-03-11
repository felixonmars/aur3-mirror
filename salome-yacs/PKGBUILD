# Maintainer: Michele Mocciola <mickele>

pkgname=salome-yacs
pkgver=7.4.1
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - YACS Module"
url="http://www.salome-platform.org"
depends=('salome-gui>=7.4.0' 'salome-gui<7.5.0' 'graphviz' 'qscintilla')
makedepends=('doxygen' 'swig2' 'python2-sphinx')
arch=('i686' 'x86_64')
license=('LGPL')
source=("${pkgname}.profile" "patch-graphiviz-2.38.diff")

_source=yacs
_installdir=/opt/salome/yacs
_paraviewrootdir=/usr
_paraviewver=4.1

prepare() {
  msg "Connecting to git server..."

  if [[ -d ${_source} ]] ; then
     rm -rf ${_source}
  fi

  git clone git://git.salome-platform.org/modules/${_source}.git
  cd ${_source}
  git checkout V7_4_1

  msg "GIT checkout done or server timeout"

  for _FILE in {"src/runtime/Test/CMakeLists.txt","src/yacsloader/pmml/CMakeLists.txt"}
  do
    sed -e "s|\${CPPUNIT_INCLUDE_DIRS}|\${CPPUNIT_INCLUDE_DIRS}\n  \${LIBXML2_INCLUDE_DIR}|" -i ${_FILE}
  done
  
  # patch taken from usptream, necessary to compile with graphviz-2.38
  patch -Np1 -i "${srcdir}/patch-graphiviz-2.38.diff"
  
  # python -> python2
  for _FILE in `grep -Rl "/usr/bin/env python" * `
  do
	sed -e "s|/usr/bin/env python|/usr/bin/env python2|" -i ${_FILE}
  done
}

build() {
  source /etc/salome/profile.d/salome-kernel.sh
  source /etc/salome/profile.d/salome-gui.sh

  rm -rf "$srcdir/$_source/build"
  mkdir -p "$srcdir/$_source/build"
  cd "$srcdir/$_source/build"

  # necessary to compile with graphviz-2.38
  local graphviz_flags="-DGRAPHVIZ_ROOT_DIR=/usr \
     -DGRAPHVIZ_INCLUDE_DIR=/usr/include/graphviz \
     -DGRAPHVIZ_cdt_LIBRARY=/usr/lib/libcdt.so \
     -DGRAPHVIZ_graph_LIBRARY=/usr/lib/libcgraph.so \
     -DGRAPHVIZ_gvc_LIBRARY=/usr/lib/libgvc.so \
     -DGRAPHVIZ_pathplan_LIBRARY=/usr/lib/libpathplan.so"
     
  cmake .. \
     -DCMAKE_INSTALL_PREFIX=$_installdir \
     ${graphviz_flags} \
     -DPYTHON_EXECUTABLE=/usr/bin/python2 \
     -DSPHINX_EXECUTABLE=/usr/bin/sphinx-build2 \
     -DVTK_DIR="${_paraviewrootdir}/lib/cmake/paraview-${_paraviewver}" \
     -DSWIG_EXECUTABLE=/usr/bin/swig-2 \
     -DLIBXML2_ROOT_DIR=/usr \
     -DLibXml2_DIR=/usr/lib/cmake/libxml2 \
     -DLIBXML2_INCLUDE_DIR=/usr/include/libxml2
     
  make
}

package() {
  cd "$srcdir/$_source/build"

  make DESTDIR="$pkgdir/" install

  install -D -m755 "$srcdir/$pkgname.profile" \
                   "$pkgdir/etc/salome/profile.d/$pkgname.sh"
}
md5sums=('c0ef5275f2c7382756a0481230a34f1e'
         'd10fa0392d1f29c2b725a98688d2e7d8')
