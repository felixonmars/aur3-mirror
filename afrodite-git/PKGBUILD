# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=afrodite-git
pkgver=20120602
pkgrel=1
pkgdesc="Library containing the completion engine for Vala language"
arch=('i686' 'x86_64')
url="http://code.google.com/p/vtg/"
license=('GPL2')
depends=('vala')
makedepends=('git' 'gnome-common')
options=(!libtool)
provides=('afrodite')
conflicts=('afrodite')

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
  ./autogen.sh --disable-gen-project --disable-vtg-plugin --enable-afrodite --prefix=/usr
  ## The 1st run determinates if we alredy have afrodite installed in the system
  ## and becouse we don't it exist with failure code and pacman terminates || error 0, prevents that
  make || return 0
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"

  make DESTDIR="${pkgdir}/" install
  mv "${pkgdir}/usr/share/doc/vtg/" "${pkgdir}/usr/share/doc/afrodite"
}

