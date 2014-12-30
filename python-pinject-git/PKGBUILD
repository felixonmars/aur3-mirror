# Contributor: Florijan Hamzic <florijanh@gmail.com>

_pkgname="python-pinject"
pkgname="${_pkgname}-git"
pkgver=20130801
pkgrel=1
pkgdesc="A pythonic dependency injection library"
arch=('i686' 'x86_64')
url="https://github.com/google/pinject"
license=('APACHE')
depends=('python>=3.1')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('object_providers.patch')
sha1sums=('466890b37b87d6f8bff3a88ffed089806a0de508')
_gitroot="https://github.com/google/pinject.git"
_gitname=("${_pkgname}")

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Patching with 2to3..."

  2to3 -w .
  patch -p1 -R -i ../object_providers.patch
}

package(){
  cd "${srcdir}/${_gitname}"
  python setup.py install --root="$pkgdir" --prefix=/usr
}
