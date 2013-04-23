# Maintainer: Filip Brcic <brcha@gna.org>
# OldMaintainer: rubenvb vanboxem <dottie> ruben <attie> gmail <dottie> com

_svn_date=20130403
pkgname=mingw-w64-crt-secure
pkgver=2.0.999.svn${_svn_date}
pkgrel=1
pkgdesc='MinGW-w64 CRT for Windows'
arch=('any')
url='http://mingw-w64.sourceforge.net'
license=('custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
depends=('mingw-w64-gcc-base' 'mingw-w64-binutils' 'mingw-w64-headers')
makedepends=()
optdepends=()
provides=('mingw-w64-crt' 'mingw-w64-crt-svn')
conflicts=('mingw-w64-crt')
replaces=('mingw-w64-crt')
backup=()
options=('!strip' '!buildflags' '!libtool' '!emptydirs')
source=("https://dl.dropbox.com/u/844580/mingw-w64-trunk-snapshot-${_svn_date}.tar.gz"
        "mingw-w64-crt-add-vsprintf_s-wrapper.patch")
md5sums=('56407c412f1f58f94d9429efd70f3f85'
         '6b28db9711921b1ffd3fccc057dd8875')

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd ${srcdir}/trunk

  # Add Windows XP wrapper for vsprintf_s
  patch -p0 -i ${srcdir}/mingw-w64-crt-add-vsprintf_s-wrapper.patch

  pushd mingw-w64-crt
  autoreconf -i --force
  popd

  for _target in ${_targets}; do
    msg "Building ${_target} CRT"
    if [ ${_target} == "i686-w64-mingw32" ]; then
        _crt_configure_args="--disable-lib64 --enable-lib32"
    elif [ ${_target} == "x86_64-w64-mingw32" ]; then
        _crt_configure_args="--disable-lib32 --enable-lib64"
    fi
    mkdir -p ${srcdir}/crt-${_target} && cd ${srcdir}/crt-${_target}
    ${srcdir}/trunk/mingw-w64-crt/configure \
      --prefix=/usr/${_target} \
      --host=${_target} \
      --target=${_target} \
      --build=${CHOST} \
      --enable-wildcard \
        ${_crt_configure_args}
    make
  done
}

package() {
  for _target in ${_targets}; do
    msg "Installing ${_target} headers"
    cd ${srcdir}/crt-${_target}
    make DESTDIR=${pkgdir} install
    
    # no need for *.c files in include dir
    rm ${pkgdir}/usr/${_target}/include/*.c 
  done
}

