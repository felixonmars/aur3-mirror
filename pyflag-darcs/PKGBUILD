# Maintainer: Jan Lieven jan_AT_das_MINUS_labor_DOT_org
pkgname=pyflag-darcs
pkgver=20101020
pkgrel=2
pkgdesc="FLAG (Forensic and Log Analysis GUI) is an advanced forensic tool for the analysis of large volumes of log files and forensic investigations."
arch=('i686' 'x86_64')
url="http://www.pyflag.net/"
license=('GPL')
depends=('mysql-python' 'python-pexpect' 'python-dateutil')
makedepends=('darcs')
optdepends=('afflib: AFF image support'
            'geoip')
_darcstrunk='http://www.pyflag.net/pyflag'
_darcsmod='pyflag'

build() {
  export PYTHON=python2
  if [ -d ${srcdir}/${_darcsmod}/_darcs ]; then
    msg "Retrieving missing patches"
    cd ${srcdir}/${_darcsmod}
    darcs pull
  else
    msg "Retrieving complete sources"
    darcs get --partial ${_darcstrunk}
  fi

  cd ${srcdir}
  cp -r ${_darcsmod} ${_darcsmod}-build
  cd ${_darcsmod}-build

  ./autogen.sh
  ./configure --prefix=/usr
  make 
}

package() {
  cd ${srcdir}/${_darcsmod}-build

  make DESTDIR=${pkgdir}/ install
  cd ${srcdir}
  rm -rf ${_darcsmod}-build

  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      $(find ${pkgdir} -name '*.py')
}

# vim:set ts=2 sw=2 et:
