pkgname=pycuda-git
pkgver=20120803
pkgrel=2
pkgdesc="Python wrapper for Nvidia CUDA"
arch=('i686' 'x86_64')
url="http://mathema.tician.de/software/pycuda"
license=('MIT/X Consortium')
depends=('boost' 'cuda-toolkit' 'python2-numpy' 'python2-pytools' 'nvidia-utils')
makedepends=('ctags' 'python2-distribute')
provides=('pycuda')
conflicts=('pycuda')

_gitroot="http://git.tiker.net/trees/pycuda.git"
_gitname="pycuda"

build() { 
  cd "$srcdir"

  msg "Connecting to the GIT server...."
  if [ -d "$_gitname" ]; then
    cd $_gitname && git pull origin
    msg2 "Local files updated"
    cd ..
  else
    git clone $_gitroot
  fi
  msg2 "GIT checkout done or server timeout"

  rm -rf $_gitname-build
  cp -r $_gitname $_gitname-build
  cd $_gitname-build

   python2 ./configure.py --boost-inc-dir=/usr/include/boost \
                  --boost-lib-dir=/usr/lib \
                  --boost-python-libname=boost_python-mt \
                  --boost-thread-libname=boost_thread-mt \
                  --cuda-root=/usr || return 1

   make

   python2 setup.py install --root=$pkgdir
}
