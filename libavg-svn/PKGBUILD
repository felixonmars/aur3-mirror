# Maintainer: padfoot <padfoot@exemail.com.au>

pkgname=libavg-svn
_pkgname=libavg
pkgver=8922
pkgrel=1
pkgdesc='High-level multimedia platform with a focus on interactive art installations.'
arch=('i686' 'x86_64')
url='http://www.libavg.de'
depends=('libtool'
         'librsvg'
         'libxi'
         'gdk-pixbuf2'
         'libxml2'
         'ffmpeg'
         'boost'
         'boost-libs'
         'python2'
         'pango')
install=libavg.install
backup=('etc/profile.d/libavg.sh'
        'etc/profile.d/libavg.csh')
optdepends=('libvdpau'
            'libdc1394' )
makedepends=('subversion')
license=('LGPL')
provides=('libavg')
conflicts=('libavg')
source=('libavg.sh'
        'libavg.csh')

md5sums=('dc87612b5def50777621de5513694824'
         '6224961a395c77e5bfe2b008ddda024f')

_svntrunk=https://www.libavg.de/svn/trunk/libavg/
_svnmod=libavg

build() {
  cd ${srcdir}
  msg "Connecting to SVN server"
  
  if [[ -d ${_svnmod}/.svn ]]; then
      (cd ${_svnmod} && svn up -r ${pkgver})
  else
      svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  
  rm -rf ${srcdir}/${_svnmod}-build
  cp -r ${srcdir}/${_svnmod} ${srcdir}/${_svnmod}-build
  cd ${srcdir}/${_svnmod}-build

  # workaround for linking errors, caused by '-Wl,--as-needed' in /etc/makepkg.conf
  unset LDFLAGS

  # fix python2
  find -type f -exec sed -e 's_#!/usr/bin/python_&2_' -e 's_#!/usr/bin/env python_&2_' -i {} \;

  ./bootstrap

  PYTHON=/usr/bin/python2 ./configure \
    --prefix=/usr

  make ${MAKEFLAGS}
}

package() {
  cd ${srcdir}/${_pkgname}-build
  make DESTDIR=${pkgdir} install
  install -D -m644 ${srcdir}/${_pkgname}-build/src/avgrc \
    ${pkgdir}/etc/avgrc
  cd ${pkgdir}
  install -Dm755 ${srcdir}/libavg.sh etc/profile.d/libavg.sh
  install -Dm755 ${srcdir}/libavg.csh etc/profile.d/libavg.csh
}
