# Maintainer: Michele Mocciola <mickele>

pkgname=salome-hexablock
pkgver=7.4.1
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - HEXABLOCK Module"
url="http://www.salome-platform.org"
depends=('salome-geom>=7.4.0' 'salome-geom<7.5.0')
makedepends=('doxygen' 'python2-sphinx' 'swig2')
arch=('i686' 'x86_64')
license=('LGPL')
source=(${pkgname}.profile)

_source=hexablock
_installdir=/opt/salome/hexablock

prepare() {
  msg "Connecting to git server..."

  if [[ -d ${_source} ]] ; then
     rm -rf ${_source}
  fi

  git clone git://git.salome-platform.org/modules/${_source}.git
  cd ${_source}
  git checkout V7_4_1

  msg "GIT checkout done or server timeout"

  # python -> python2
  for _FILE in `grep -Rl "/usr/bin/env python" * `
  do
	sed -e "s|/usr/bin/env python|/usr/bin/env python2|" -i ${_FILE}
  done
}

build() {
  source /etc/salome/profile.d/salome-kernel.sh
  source /etc/salome/profile.d/salome-gui.sh
  source /etc/salome/profile.d/salome-geom.sh

  rm -rf "$srcdir/$_source/build"
  mkdir -p "$srcdir/$_source/build"
  cd "$srcdir/$_source/build"

  cmake .. \
     -DCMAKE_INSTALL_PREFIX=$_installdir \
     -DPYTHON_EXECUTABLE=/usr/bin/python2 \
     -DSPHINX_EXECUTABLE=/usr/bin/sphinx-build2 \
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
md5sums=('961b38ff24b084af92f2d7f26edd1f99')
