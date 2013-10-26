# Maintainer: hauptmech # Contributor: figo.zhang, chubtuff, lubosz
#
# Matlab bindings are not built by default to reduce dependencies.

pkgname=libflann
pkgver=1.8.4
pkgrel=1
pkgdesc="FLANN is a library for performing fast approximate nearest neighbor searches in high dimensional spaces"
arch=('any')
url='http://www.cs.ubc.ca/~mariusm/index.php/FLANN/FLANN'
license=('BSD')
makedepends=('cmake' 'python2')
optdepends=('hdf5' 'gtest' 'intel-tbb' 'cuda')
conflicts=('flann')
source=("http://www.cs.ubc.ca/research/flann/uploads/FLANN/flann-1.8.4-src.zip")
_python2libpath="`python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()" | tr -d '\n'`"

build() {
  cd "${srcdir}/flann-${pkgver}-src"

  sed -i 's/lib64/lib/g' cmake/flann_utils.cmake
  sed -i cmake/flann.pc.in -f - <<'==='
/lflann_cpp-gd/ c\
Libs: -L${libdir} -lflann_cpp
===
  sed -i 's/;--compiler-bindir.*$/\")/' src/cpp/CMakeLists.txt

  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_MATLAB_BINDINGS=OFF \
    -DBUILD_PYTHON_BINDINGS=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python2
  make

  sed -i 's|#!/usr/bin/env python|#!/usr/bin/python2|' \
  ../bin/download_checkmd5.py \
  ../bin/run_test.py \
  ../build/src/python/setup.py \
  ../src/python/setup.py.tpl \
  ../test/test_clustering.py \
  ../test/test_index_save.py \
  ../test/test_nn_autotune.py \
  ../test/test_nn_index.py \
  ../test/test_nn.py

  sed -i 's|#!/usr/bin/python|#!/usr/bin/python2|' \
  ../test/memusage_clustering.py \
  ../test/memusage_nn.py
}

#check() {
#  cd "${srcdir}/flann-${pkgver}-src/build"
#  # Warning: Downloads big data files.
#  make -k test
#}

package() {
  cd "${srcdir}/flann-${pkgver}-src/build"

  #install license file
  install -D -m644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  make DESTDIR="$pkgdir/" install

  # FIXME: awful hack, but I got this error without the fix:
  # running install_lib
  # copying build/lib/pyflann/exceptions.py -> /usr/lib/python2.7/site-packages/pyflann
  # error: /usr/lib/python2.7/site-packages/pyflann/exceptions.py: Permission denied
  mkdir -p "${pkgdir}${_python2libpath}"
  cp -pr "${pkgdir}/usr/share/flann/python/pyflann" "${pkgdir}${_python2libpath}/pyflann"
}

md5sums=('a0ecd46be2ee11a68d2a7d9c6b4ce701')
sha256sums=('dfbb9321b0d687626a644c70872a2c540b16200e7f4c7bd72f91ae032f445c08')
sha512sums=('47ac6be66e3ec7303d28febc5a4cea2f8d1b3d81c3b7081f27cf17936074e06e91e30123569b41269a2b97c9960274dc485a575d77c1a386e8f539a76a8d3a0a')
