# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gtk-doc-git
pkgver=20110517
pkgrel=1
pkgdesc="Documentation tool for public library API"
arch=('any')
license=('GPL' 'FDL')
depends=('docbook-xsl' 'gnome-doc-utils' 'perl')
makedepends=('pkgconfig' 'jade')
optdepends=('jade: SGML support')
url="http://www.gtk.org/gtk-doc/"
conflicts=('gtk-doc')

_gitroot="git://git.gnome.org/gtk-doc"
_gitname="gtk-doc"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "${srcdir}/${_gitname}"
  export PYTHON=/usr/bin/python2
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
}
