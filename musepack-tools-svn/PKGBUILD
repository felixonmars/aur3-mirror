# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: Phillip Michael <oopsicrappe at gmail dot com>

pkgname=musepack-tools-svn
pkgver=481
pkgrel=1
pkgdesc="Musepack sv8 decoder/encoder"
arch=('i686' 'x86_64')
url="http://www.musepack.net/"
license=('LGPL')
makedepends=('subversion' 'cmake')
provides=('musepack-tools')
conflicts=('musepack-tools')

_svntrunk="http://svn.musepack.net/libmpc/trunk"
_svnmod="libmpc"

_libcuefiletrunk="http://svn.musepack.net/libcuefile/trunk"
_libcuefilemod="libcuefile"

_libreplaygaintrunk="http://svn.musepack.net/libreplaygain"
_libreplaygainmod="libreplaygain"

build() {
  cd "${srcdir}"

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
    (cd ${_libcuefilemod} && svn up -r ${pkgver})
    (cd ${_libreplaygainmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
    svn co ${_libcuefiletrunk} --config-dir ./ -r ${pkgver} ${_libcuefilemod}
    svn co ${_libreplaygaintrunk} --config-dir ./ -r ${pkgver} ${_libreplaygainmod}    
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  cd "${srcdir}"
  rm -rf "${srcdir}"/build
  mkdir "${srcdir}"/build
  cp -r "${srcdir}"/${_svnmod} "${srcdir}"/build/${_svnmod}
  cp -r "${srcdir}"/${_libcuefilemod} "${srcdir}"/build/${_libcuefilemod}
  cp -r "${srcdir}"/${_libreplaygainmod} "${srcdir}"/build/${_libreplaygainmod}
  cd "${srcdir}"/build
  sed -i "s/-O3/-O2 -lm/g" libmpc/CMakeLists.txt

  # BUILD
  cd "${srcdir}"/build/libcuefile
  cmake -G "Unix Makefiles"
  make

  cd "${srcdir}"/build/libreplaygain
  cmake -G "Unix Makefiles"
  make
  
  cd "${srcdir}"/build/libmpc
  cmake -DREPLAY_GAIN_LIBRARY:FILEPATH="${srcdir}"/build/libreplaygain/src/libreplaygain.so
  make
}

package() {
  cd "${srcdir}"/build/libmpc
  install -D -m755 mpcenc/mpcenc "${pkgdir}"/usr/bin/mpcenc
  install -D -m755 mpcdec/mpcdec "${pkgdir}"/usr/bin/mpcdec
  install -D -m755 mpcgain/mpcgain "${pkgdir}"/usr/bin/mpcgain
  install -D -m755 mpcchap/mpcchap "${pkgdir}"/usr/bin/mpcchap
  install -D -m755 mpccut/mpccut "${pkgdir}"/usr/bin/mpccut
  install -D -m755 mpc2sv8/mpc2sv8 "${pkgdir}"/usr/bin/mpc2sv8
}
