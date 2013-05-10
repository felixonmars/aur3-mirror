# Maintainer: Zylex <zylex.stk@gmail.com>

pkgname=vala-gen-project-git
pkgver=20130510
pkgrel=1
pkgdesc="Tool to generate Vala projects from templates, taken from VTG."
arch=('i686' 'x86_64')
url="http://code.google.com/p/vtg/"
license=('GPL2')
depends=('vala')
makedepends=('git' 'gnome-common')
options=(!libtool)
provides=('vala-gen-project')
conflicts=('vala-gen-project' 'vala-gen-prject-git')

_gitroot=git://gitorious.org/vala-toys/vala-toys.git
_gitname=vala-toys

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}" --depth 1
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_gitname}-build"
  cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  #
  # BUILD HERE
  #
  LIBS=-lm ./autogen.sh --prefix=/usr --disable-afrodite --disable-vtg-plugin --enable-gen-project --with-systemlibs
  
}

package() {
  cd "${srcdir}/${_gitname}-build"

  make DESTDIR="${pkgdir}/" install
  mv "${pkgdir}/usr/share/doc/vtg/" "${pkgdir}/usr/share/doc/vala-gen-project"
}

