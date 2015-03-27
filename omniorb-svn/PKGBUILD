# Maintainer: Benjamin Oldenburg <benjamin.oldenburg@gmail.com>

pkgname=omniorb-svn
pkgver=6283
pkgrel=1
pkgdesc="A CORBA object request broker for C++ and Python."
arch=('i686' 'x86_64')
url="http://omniorb.sourceforge.net/"
license=('GPL2' 'LGPL2')
depends=('python' 'openssl')
makedepends=('pkgconfig')
source=(svn://svn.code.sf.net/p/omniorb/svn/trunk/omniORB)
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/omniORB
  svnversion | tr -d [A-z]
}

build() {
  cd "${srcdir}/omniORB"

#  # python2 fix
#  for file in $(find . -name '*.py' -print); do
#    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' "$file"
#    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' "$file"
#  done

  PYTHON=/usr/bin/python ./configure \
         --prefix=/usr \
         --with-omniORB-config=/etc/omniorb/omniORB.cfg \
         --with-omniNames-logdir=/var/log/omniORB \
         --with-openssl=/usr

  make $MAKEFLAGS 
}

package() {
  cd "${srcdir}/omniORB"

  make DESTDIR="${pkgdir}" install

  for i in man/man1/*.1; do
    install -D -m 644 $i "${pkgdir}/usr/share/${i}"
  done
  chmod 755 "${pkgdir}"/{usr,usr/bin,usr/lib,usr/share,usr/include,usr/share/idl,usr/lib/pkgconfig,usr/lib/python3.4,usr/lib/python3.4/site-packages}
}
