#maintainer: Your Name <youremail at domain dot com>

pkgname=cpconverter
pkgver=0.5
pkgrel=1
pkgdesc="A simple utility to change the code page of plain text based files."
arch=(any)
url="http://cpconverter.googlecode.com"
license=('GPL')
groups=()
depends=('python2' 'pygtk>=2.12')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
source=(http://cpconverter.googlecode.com/files/${pkgname}_${pkgver}.tar.gz
        ${pkgname}.sh)
noextract=()

build() {
  mkdir -p ${pkgdir}/{etc/profile.d,opt/cpconverter} || return 1
  cd ${srcdir}/${pkgname}_${pkgver} || return 1
  sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' cpConverter.py || return 1
  sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' cpConverter.py || return 1

  # Use absolute path 
  sed -i s/'\".\/gui\/gui\.xml\"/os\.path\.join(os\.path\.dirname(__file__),\ \"gui\/gui\.xml\")/g' cpConverter.py
  sed -i s/'\".\/gui\/preview\.xml\"/os\.path\.join(os\.path\.dirname(__file__),\ \"gui\/preview\.xml\")/g' cpConverter.py

  # Use aother file as main excutable
  cp cpConverter.py cpconverter || return 1
  chmod +x cpconverter || return 1

  # Installation
  cp -r ${srcdir}/${pkgname}_${pkgver}/* ${pkgdir}/opt/cpconverter || return 1

  # Install shell script
  install -m644 ${srcdir}/${pkgname}.sh ${pkgdir}/etc/profile.d/${pkgname}.sh || return 1
}
md5sums=('71411b5687b8cd367c9ee5de0f73b6a9'
         '816230447563c835cb37a0c95dcf98b1')
