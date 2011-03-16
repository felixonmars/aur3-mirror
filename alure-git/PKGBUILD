# Contributor: Markus Martin
# Maintainer: kfgz <kfgz at interia pl>

pkgname=alure-git
pkgver=20110316
pkgrel=1
pkgdesc="Utility library to help manage common tasks with OpenAL applications."
arch=('i686' 'x86_64')
url="http://kcat.strangesoft.net/alure.html"
license=('LGPL')
depends=('openal')
makedepends=('cmake')
conflicts=('alure')
provides=('alure')
optdepends=('sndfile: Uncompressed audio support'
            'vorbisfile: OGG Vorbis support'
            'flac: FLAC support')

_gitroot="git://repo.or.cz/alure.git alure"
_gitname="alure"

build() {
  cd ${srcdir}
  msg "Connecting to repo.or.cz GIT server...."

  if [ -d ${srcdir}/${_gitname} ] ; then
  cd ${_gitname} && git pull origin
  msg "The local files are updated."
  else
  git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"

  msg "Creating build directory"
  if [ -d ${srcdir}/$_gitname-build ]; then rm -rf ${srcdir}/$_gitname-build; fi
  cp -R ${srcdir}/$_gitname ${srcdir}/$_gitname-build
  
  msg "Starting make..."
  cd "${srcdir}/${_gitname-build}"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}
	
package() {
  cd "${srcdir}/${_gitname-build}"
  make DESTDIR=${pkgdir} install
}
