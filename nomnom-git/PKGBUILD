# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=nomnom-git
pkgver=20130301
pkgrel=1
pkgdesc="Application for downloading videos from Youtube and other similar video websites"
arch=('i686' 'x86_64')
url="http://nomnom.sourceforge.net/"
license=('GPL3')
depends=('qt4' 'quvi' 'umph' 'qjson' 'curl')
makedepends=('git')
conflicts=('nomnom')

_gitname=nomnom
_gitroot=http://repo.or.cz/r/nomnom.git
 
build() {
  cd "${srcdir}"
  
  msg "Connecting to GIT server...."
 
  if [ -d "${srcdir}"/${_gitname} ]; then
     cd ${_gitname}
     git pull origin
     msg "The local files are updated..."
  else
     git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
 
  if [ -d "${srcdir}"/${_gitname}-build ]; then
     msg "Cleaning the previous build directory..." 
     rm -rf "${srcdir}"/${_gitname}-build
  fi

  git clone "${srcdir}"/${_gitname} "${srcdir}"/${_gitname}-build
 
  cd "${srcdir}"/${_gitname-build}

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${_gitname-build}
  make DESTDIR="${pkgdir}" install
}