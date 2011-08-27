#Contributor: Tom Burdick <thomas.burdick@gmail.com> 

pkgname=msgpack-git
pkgver=20100624
pkgrel=1
pkgdesc="MessagePack fast streaming serialization libraries for C and C++"
arch=('i686' 'x86_64')
url="http://github.com/msgpack/msgpack/"
license=('mit')
depends=()
makedepends=('git' 'gcc' 'make')
provides=('msgpack', 'msgpack-git')
conflicts=('msgpack')

_gitroot="git://github.com/msgpack/msgpack.git"
_gitname="msgpack"

build() {
  cd ${srcdir}
  msg "Connecting to github.com GIT server...."
  
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done or server timeout"
  
  msg "Creating build directory"
  if [ -d "${srcdir}/$_gitname-build" ]; then rm -rf "${srcdir}/$_gitname-build"; fi
  cp -R "${srcdir}/$_gitname" "${srcdir}/$_gitname-build"
  
  cd ${srcdir}/$_gitname-build/cpp

  msg "Starting make..."
  #msg "Applying patches ..."
  #patch -Np2 -i "${srcdir}/../makefile.patch" || return 1

  ./bootstrap
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  #chmod -x ${pkgdir}/usr/include/* || return 1
}
