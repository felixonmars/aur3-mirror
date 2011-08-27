# Maintainer: Artem A. Klevtsov unikum.pm@gmail.com
# Contributor: Artem A. Klevtsov unikum.pm@gmail.com
pkgname=bookmanager-git
pkgver=20110710
pkgrel=1
pkgdesc="Simple EBook manager app for kde4 supporting basic collection management and tabbed document viewing"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Book+Manager?content=137437&PHPSESSID=edc41000060b4a0c35d65e136a000138"
license=('GPL')
depends=('kdelibs')
makedepends=('git' 'cmake' 'automoc4')

_gitroot='git://gitorious.org/book-manager/book-manager.git'
_gitname='book-manager'

build() {
  cd ${srcdir}

  msg "Connecting to GIT server..."
  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
    cd ${_gitname}
  fi
  msg "GIT checkout done or server timeout"

  msg "Starting make..."
  if [ -d "${srcdir}/${_gitname}/build" ]; then
    rm -rf "${srcdir}/${_gitname}/build"
  fi
  mkdir "${srcdir}/${_gitname}/build"
  cd "${srcdir}/${_gitname}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "${srcdir}/${_gitname}/build"
  make DESTDIR="${pkgdir}" install
  rm -rf "${srcdir}/${_gitname}/build"
}
