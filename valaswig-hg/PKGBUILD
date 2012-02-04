pkgname=valaswig-hg
pkgver=106
pkgrel=1
pkgdesc="A tool to parse vala or vapi files to transform them into swig interface files."
arch=('i686' 'x86_64')
url="http://hg.youterm.com/valaswig"
license=('GPL2')
depends=('vala')
makedepends=('mercurial')
provides=("valaswig")
conflicts=('valaswig')

_hgroot="http://hg.youterm.com"
_hgrepo="valaswig"

build() {
  cd ${srcdir}
  msg "Connecting to Mercurial server...."

  if [ -d ${_hgrepo} ] ; then
    cd ${_hgrepo}
    hg pull -u
    msg "The local files are updated."
  else
    hg clone ${_hgroot} ${_hgrepo}
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/${_hgrepo}-build
  hg clone ${srcdir}/${_hgrepo} ${srcdir}/${_hgrepo}-build
  cd ${srcdir}/${_hgrepo}-build


  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
         $(find ${srcdir}/${_hgrepo}-build -name '*.py')
	make all|| return 1
}

package() {
  cd ${srcdir}/${_hgrepo}-build
  make DESTDIR=${pkgdir} install
  rm -rf ${srcdir}/${_hgrepo}-build
}
