# Maintainer: kfgz <kfgz at interia pl>

pkgname=ols-fwloader-git
pkgver=20110918
pkgrel=1
pkgdesc="Firmware loader for OpenBench Logic Sniffer."
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/robots/ols-fwloader/"
depends=('libusb')
makedepends=('git')

_gitroot="git://github.com/robots/ols-fwloader"
_gitname="ols-fwloader"

build() {
  cd "${srcdir}"
  msg "Connecting to github.com GIT server...."

  if [ -d "${srcdir}"/${_gitname} ] ; then
   cd ${_gitname} && git pull origin
   msg "The local files are updated."
  else
   git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Creating build directory"
  
  if [ -d "${srcdir}"/${_gitname}-build ]; then rm -rf "${srcdir}"/${_gitname}-build; fi
  cp -R "${srcdir}"/${_gitname} "${srcdir}"/${_gitname}-build

  msg "Starting make..."
  cd "${srcdir}"/${_gitname}-build
  
  autoreconf --install
  ./configure --prefix="${pkgdir}"/usr
  make
}

package() {
  cd "${srcdir}"/${_gitname}-build
  make install
}
