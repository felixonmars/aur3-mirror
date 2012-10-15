# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=okular-browserplugin
pkgver=20121015
pkgrel=1
pkgdesc="use okular as browser plugin without downloading the pdf"
arch=('i686' 'x86_64')
url=("https://github.com/afrimberger/okularplugin")
license=('GPL')
provides=('okularplugin')
conflicts=('okularplugin-git')
depends=('kdegraphics-okular')
makedepends=('git' 'gcc' 'automoc4' 'cmake' 'kdelibs')
optdepends=('chromium: use okularplugin with chromium browser'
			'firefox: use okularplugin with firefox browser')
install=okularplugin.install
_gitroot=("https://github.com/afrimberger/okularplugin")
_gitname=("okularplugin")

build() {
  cd ${srcdir}

 ## Git checkout
  if [ -d ${srcdir}/${_gitname} ] ; then
    msg "Git checkout:  Updating existing tree"
    cd ${_gitname} && git pull origin
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone ${_gitroot}
  fi
  msg "Checkout completed"

 ## Build
  rm -rf ${srcdir}/${_gitname}/build
  mkdir ${srcdir}/${_gitname}/build
  cd ${srcdir}/${_gitname}/build
  cmake ..
  make
}

package() {
  cd ${srcdir}/${_gitname}/build
  make DESTDIR=${pkgdir} install
}
