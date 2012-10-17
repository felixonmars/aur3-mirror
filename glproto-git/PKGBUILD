# Maintainer: kfgz <kfgz at interia pl>
# Contributor: Cilyan Olowen <gaknar at gmail dot com>

pkgname=glproto-git
pkgver=20121017
pkgrel=1
pkgdesc="X11 OpenGL extension wire protocol"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
provides=('glproto' 'glproto=1.4.16')
makedepends=('xorg-util-macros>=1.2' 'git')
conflicts=('glproto')
#groups=('xorg')

_gitroot="git://git.freedesktop.org/git/xorg/proto/glproto"
_gitname="glproto"
#http://cgit.freedesktop.org/xorg/proto/glproto/

build() {
  cd "${srcdir}"
  msg "Connecting to git.freedesktop.org GIT server...."

  if [ -d "${srcdir}"/${_gitname} ] ; then
   cd "${_gitname}" && git pull origin
   msg "The local files are updated."
  else
   git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"

  msg "Creating build directory"
  if [ -d "${srcdir}"/${_gitname}-build ]; then rm -rf "${srcdir}"/${_gitname}-build; fi
  cp -R "${srcdir}"/${_gitname} "${srcdir}"/${_gitname}-build

  msg "Starting make..."
  cd "${srcdir}"/${_gitname}-build
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${_gitname}-build
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 "${srcdir}"/${_gitname-build}/COPYING \
                "${pkgdir}"/usr/share/licenses/${pkgname}/
}
