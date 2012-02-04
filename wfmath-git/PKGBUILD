#Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=wfmath-git
pkgver=20111124
pkgrel=1
pkgdesc="WorldForge math library"
arch=('i686' 'x86_64')
url="http://www.worldforge.org/"
license=('GPL2')
makedepends=('git')
provides=('wfmath')
conflicts=('wfmath')
options=(!libtool)

_gitroot='git://github.com/worldforge/wfmath.git'
_gitname='wfmath'

build() {
  msg "Connecting to the GIT server...."
  cd "${srcdir}"

  if [[ -d "$srcdir/$_gitname" ]] ; then
      cd "$_gitname"
      git pull origin
      msg "The local files are updated."
  else
      git clone $_gitroot --depth 1
  fi

  msg "GIT checkout done"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build/"
  cp -r "${srcdir}/${_gitname}/" "${srcdir}/${_gitname}-build/"

  cd "${srcdir}/${_gitname}-build/"


  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${_gitname}-build/"

  make DESTDIR="${pkgdir}" install
}
