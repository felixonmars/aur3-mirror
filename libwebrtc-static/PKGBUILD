# Maintainer: Sergio Correia <sergio@correia.cc>

pkgname=libwebrtc-static
_pkgname=libwebrtc
pkgver=5441
pkgrel=1
pkgdesc="A library that enables web browsers with Real-Time Communications (RTC) capabilities via simple Javascript APIs"
arch=('x86_64')
url="http://www.webrtc.org/"
license=('custom')
depends=('jdk7-openjdk')
makedepends=('subversion' 'depot_tools-svn' 'python2' 'python2-colorama')
provides=('libwebrtc')
options=('staticlibs')
source=('01-fix-jni-peer-connection-include.patch'
        '02-dont-make-thin-archives.patch'
        'LICENSE'
        'PATENTS')
sha256sums=('ae4858e126c8a626d9fa742138013a8d4245163d0cbce8dd2b987f0b3d615f31'
            'ede20f8a3896e36f54d954c5ac2d796bd033b58a05b6e6123dfc57ef027ba818'
            'ab00a482b6a3902e40211b43c5d0441962ea99b6cc7c25c0f243fa270b78d482'
            'd77073c6cada73cd1d94b8d5e564cda2797e88cc626e91659e27e4bc42d32ddf')

prepare() {
  mkdir -p "${srcdir}"/"${_pkgname}"
  cd "${srcdir}"/"${_pkgname}"

  mkdir -p .bin
  ln -sf /usr/bin/python2 "$(pwd)"/.bin/python
  export PATH="$(pwd)"/.bin:"${PATH}"

  /opt/depot_tools-svn/gclient config http://webrtc.googlecode.com/svn/trunk
  /opt/depot_tools-svn/gclient sync --revision "${pkgver}" --force

  cd trunk

  # discarding uncommited changes.
  svn revert talk/app/webrtc/java/jni/peerconnection_jni.cc
  pushd tools/gyp
  svn revert pylib/gyp/generator/ninja.py
  popd

  patch -uNp1 -i ../../01-fix-jni-peer-connection-include.patch
  patch -uNp1 -i ../../02-dont-make-thin-archives.patch
}

build() {
  cd "${srcdir}"/"${_pkgname}"/trunk
  python2 build/gyp_chromium --depth=. -Dextra_gyp_flag=0 -Dinclude_tests=0 -Denable_google_now=0 -Dlogging=0 all.gyp
  /opt/depot_tools-svn/ninja -C out/Release
}

package() {
  cd "${srcdir}"
  for i in LICENSE PATENTS; do
    install -m644 -D "${i}" "${pkgdir}"/usr/share/licenses/"${pkgname}"/"${i}"
  done

  cd "${_pkgname}"/trunk

  # packaging the library
  mkdir -p .lib .tmp
  rm -f .lib/*

  for l in $(find out/Release -name *.a | grep -vE "do.not.use"); do
    rm -f .tmp/*
    pushd .tmp
    ar vx ../"${l}"
    r="${RANDOM}"
    for o in *.o; do
      cp "${o}" ../.lib/"${r}"-"${o}"
    done
    popd
  done

  pushd .lib
  ar rcs libWebRTC.a *.o
  install -m644 -D libWebRTC.a "${pkgdir}"/usr/lib/libWebRTC.a
  popd

  # includes
  for f in $(find . -name "*.h" | grep -E "^\.\/webrtc|^\.\/talk"); do
    install -m644 -D "${f}" "${pkgdir}"/usr/include/libwebrtc/"${f}"
  done
}

# vim:set ts=2 sw=2 et:
