#Contributor: Tom Burdick <thomas.burdick@gmail.com> 

pkgname=python-msgpack-git
pkgver=20100624
pkgrel=1
pkgdesc="Python module for MessagePack serialization/deserialization library" 
arch=('i686' 'x86_64')
url="http://github.com/msgpack/msgpack/"
license=('mit')
depends=('python' 'cython')
makedepends=('git' 'cython')
provides=('python-msgpack' 'python-msgpack-git')
conflicts=('python-msgpack')

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
  
  msg "Starting make..."
  cd ${srcdir}/$_gitname-build/python

  #msg "Applying patches ..."
  #patch -Np2 -i "${srcdir}/../makefile.patch" || return 1
  
  /usr/bin/python setup.py build || return 1
  /usr/bin/python setup.py install --root=${pkgdir} || return 1
}
