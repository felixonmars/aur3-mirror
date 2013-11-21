# Maintainer: Christian Bühler <christian.buehler@ipoplan.de>
pkgname=mingw-w64-cal3d-svn
pkgver=560
pkgrel=1
pkgdesc="3d character animation library (mingw-w64)"
arch=('any')
url="https://gna.org/projects/cal3d"
license=('LGPL')
makedepends=('subversion' 'mingw-w64-gcc')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=(svn://svn.gna.org/svn/cal3d/trunk/cal3d)
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$SRCDEST/cal3d"
  svnversion | tr -d [A-z]
}

prepare() {
  cd "$srcdir/cal3d"

  # http://gna.org/bugs/?11499
  sed -i 's/AM_USE_UNITTESTCPP/# AM_USE_UNITTESTCPP/' configure.in
}

build() {
  unset LDFLAGS CPPFLAGS
  cd "$srcdir/cal3d"
  autoreconf --install --force
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure \
      --prefix=/usr/${_arch} \
      --host=${_arch}
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/cal3d/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r $pkgdir/usr/${_arch}/share
  done
}

# vim:set ts=2 sw=2 et:
