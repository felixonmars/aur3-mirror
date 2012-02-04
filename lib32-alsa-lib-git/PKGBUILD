# Maintainer: John Schoenick <john@pointysoftware.net>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=lib32-alsa-lib-git
pkgver=20110826
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support (32 bit) - Git version"
arch=('x86_64')
url="http://www.alsa-project.org"
depends=('lib32-glibc' 'alsa-lib')
makedepends=('gcc-multilib')
license=('GPL')
options=(!libtool)
source=()
provides=("lib32-alsa-lib=1.0.24.1")
conflicts=('lib32-alsa-lib')

_gitroot=git://git.alsa-project.org/alsa-lib.git
_gitname=alsa-lib

build() {
  cd ${srcdir}
  if [ -d $_gitname ] ; then
      ( cd $_gitname && git pull ) 
  else
    git clone $_gitroot
  fi

  rm -rf "${_gitname}_build"
  cp -r "${_gitname}"{,_build}
  cd "${_gitname}_build"
  
  autoreconf -v --force --install

  export CC='gcc -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-python
  make
}

package() {
  cd "$srcdir/${_gitname}_build"
  make DESTDIR=$pkgdir install

  # Clean up lib32 package
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
