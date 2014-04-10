# Maintainer: Jonah Bernhard <jonah.bernhard at gmail dot com>
pkgname=mlbviewer
pkgver=2014_sf_1
_pkgyear=${pkgver%_sf_*}
pkgrel=1
pkgdesc="A collection of tools to view and listen to streaming baseball games from MLB.TV."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mlbviewer"
license=('GPL2')
depends=('libconfig' 'curl' 'python2' 'rtmpdump')
makedepends=('subversion')
optdepends=('mpv: lightweight streaming media player')
install="${pkgname}.install"
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/2014/${pkgname}2014-sf-1.tar.gz")
sha1sums=('3b4102ef7645518ad884a74b194005a90b083bf2')

build () {
  # python2
  cd ${srcdir}/${pkgname}${_pkgyear}
  sed -i 's:#!/usr/bin/env python:#!/usr/bin/env python2:' *.py

  # build mlbhls for nexdef
  cd ${srcdir}
  svn export --force --quiet https://mlbtv-hls-nexdef.googlecode.com/svn/branches/experimental mlbhls
  cd mlbhls
  make
}

package () {
  cd ${srcdir}/${pkgname}${_pkgyear}

  # create package structure
  install -d ${pkgdir}/usr/{bin,{lib,share/{doc,licenses}}/${pkgname}}

  # install and symlink main executables
  for i in *.py; do
    install -m755 $i ${pkgdir}/usr/lib/${pkgname}
    ln -s /usr/lib/${pkgname}/$i ${pkgdir}/usr/bin/${i%.py}
  done

  # main program libs and tests
  cp -r MLBviewer test ${pkgdir}/usr/lib/${pkgname}

  # mlbhls
  install -m755 ${srcdir}/mlbhls/mlbhls ${pkgdir}/usr/bin

  # documentation and license
  install -m644 MLBPLAY-HELP MiLB-HELP QUICK-START README REQUIREMENTS-${_pkgyear}.txt TOOLS ${pkgdir}/usr/share/doc/${pkgname}
  install -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
