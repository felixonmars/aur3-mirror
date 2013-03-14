# Maintainer: Enric Morales <geekingaround@enric.me>
pkgname=ibus-hangul-git
pkgver=20130314
pkgrel=1
pkgdesc='Korean input engine for IBus'
arch=('i686' 'x86_64')
license=('LGPL')
url="http://ibus.googlecode.com"
depends=('ibus-git' 'libhangul')
makedepends=('git' 'intltool') 
provides=('ibus-hangul')
conflicts=('ibus-hangul')

_gitname="ibus-hangul"
_gitroot="https://github.com/choehwanjin/ibus-hangul"

build() {
  cd ${srcdir}

  msg "Connecting to ${_gitname} GIT server..."
  if [ -d ${_gitname} ]; then
      cd ${_gitname} && git pull origin master
      msg "The local files are updated."
  else
      git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout. Preparing sources..."
  rm -rf "${srcdir}/${_gitname}-build"
  cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  msg "Starting make..."

  ./autogen.sh

  PYTHON=python2 ./configure --prefix=/usr --libexecdir=/usr/lib/ibus
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make NO_INDEX=true DESTDIR="${pkgdir}" install
}  
