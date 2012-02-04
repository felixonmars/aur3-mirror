# Maintainer : Jekyll Wu <adaptee [at] gmail [dot] com>

pkgname=ibus-gjs-git
pkgver=20111111
pkgrel=1
pkgdesc="GNOME-Shell GJS Plugin for IBus"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://ibus.googlecode.com"
depends=( 'ibus-git' 'gnome-shell' 'gjs' )
makedepends=('git' 'intltool')

_gitname="ibus-gjs"
_gitroot="git://github.com/fujiwarat/ibus-gjs"

build() {
  cd ${srcdir}

  msg "Connecting to ${_gitname} GIT server..."
  if [ -d ${_gitname} ]; then
      cd ${_gitname} && git pull origin master
      msg "The local files are updated."
  else
      git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout. Preparing sources..."
  rm -rf "${srcdir}/${_gitname}-build"
  cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  msg "Starting make..."

  ./autogen.sh 
  ./configure --prefix=/usr 
  make 
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR=${pkgdir} install 
}

# vim:set ts=2 sw=2 et:

