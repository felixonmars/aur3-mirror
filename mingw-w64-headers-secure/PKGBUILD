# Maintainer: Filip Brcic <brcha@gna.org>
# OldMaintainer: rubenvb vanboxem <dottie> ruben <attie> gmail <dottie> com

_svn_date=20130403
pkgname='mingw-w64-headers-secure'
pkgver=2.0.999.svn${_svn_date}
pkgrel=1
pkgdesc="MinGW-w64 headers for Windows"
arch=('any')
url="http://mingw-w64.sourceforge.net"
license=('custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
depends=()
makedepends=()
optdepends=()
provides=('mingw-w64-headers' 'mingw-w64-headers-svn')
conflicts=('mingw-w64-headers')
replaces=('mingw-w64-headers')
backup=()
options=('!strip' '!libtool' '!emptydirs')
source=("https://dl.dropbox.com/u/844580/mingw-w64-trunk-snapshot-${_svn_date}.tar.gz")
md5sums=('56407c412f1f58f94d9429efd70f3f85')

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _target in ${_targets}; do
    msg "Configuring ${_target} headers"
    mkdir -p ${srcdir}/headers-${_target} && cd ${srcdir}/headers-${_target}
    ${srcdir}/trunk/mingw-w64-headers/configure \
      --prefix=/usr/${_target} \
      --enable-sdk=all \
      --enable-secure-api \
      --host=${_target} \
      --target=${_target} \
      --build=${CHOST}
  done
}

package() {
  for _target in ${_targets}; do
    msg "Installing ${_target} headers"
    cd ${srcdir}/headers-${_target}
    make DESTDIR=${pkgdir} install
    rm ${pkgdir}/usr/${_target}/include/pthread_time.h
    rm ${pkgdir}/usr/${_target}/include/pthread_unistd.h
  done

  msg "Installing MinGW-w64 licenses"
  install -Dm644 ${srcdir}/trunk/COPYING.MinGW-w64/COPYING.MinGW-w64.txt ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.MinGW-w64.txt
  install -Dm644 ${srcdir}/trunk/COPYING.MinGW-w64-runtime/COPYING.MinGW-w64-runtime.txt ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.MinGW-w64-runtime.txt
  install -Dm644 ${srcdir}/trunk/mingw-w64-headers/ddk/readme.txt ${pkgdir}/usr/share/licenses/${pkgname}/ddk-readme.txt
  install -Dm644 ${srcdir}/trunk/mingw-w64-headers/direct-x/COPYING.LIB ${pkgdir}/usr/share/licenses/${pkgname}/direct-x-COPYING.LIB
  install -Dm644 ${srcdir}/trunk/mingw-w64-headers/direct-x/readme.txt ${pkgdir}/usr/share/licenses/${pkgname}/direct-x-readme.txt
}
