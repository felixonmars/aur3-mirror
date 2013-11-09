# $Id$
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Vincent Cappe <vcappe at gmail dot com>
# Contributor: Jeff Bailes <thepizzaking at gmail dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

_pkgname=liboggz
pkgname=liboggz-git
pkgver=1.1.1.32.g6418a4f
pkgrel=1
pkgdesc="A simple programming interface for reading and writing Ogg files and streams"
arch=('i686' 'x86_64')
url="http://www.xiph.org/oggz/"
license=('BSD')
depends=('libogg' 'sh')
makedepends=('doxygen' 'git')
conflicts=('liboggz')
replaces=('liboggz')
provides=('liboggz')
options=('!libtool')
source=("git://git.xiph.org/liboggz.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
  # license
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # bash completion
  install -Dm644 bash-completion/oggz "${pkgdir}/usr/share/bash-completion/completions/oggz"
}
