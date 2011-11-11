# Maintainer: vando <facundo@esdebian.org>

pkgname=frontweb
pkgver=137
pkgrel=1
pkgdesc="A tool for cli to convert rst into website"
arch=('i686' 'x86_64')
url="http://frontweb.com.ar/"
license=('GPL3')
depends=('django' 'docutils' 'python2' 'python2-distribute' 'yapsy')
makedepends=('mercurial')
optdepends=('imagemagick: for gallery directive'
            'python2-pygments: for code-block directive')

_hgroot="https://bitbucket.org/hugoruscitti"
_hgrepo="frontweb"

build() {
  
  msg "Preparing for build"
  rm -rf ${srcdir}/frontweb-build || return 1
  cp -a ${srcdir}/${_hgrepo}  ${srcdir}/frontweb-build || return 1
  cd ${srcdir}/frontweb-build
  
  # Patching for python2
  sed -i 's/python/python2/' frontweb/comandos.py
 
  msg "Starting make..."
  python2 setup.py install --root=${pkgdir} || return 1
  
  
}
