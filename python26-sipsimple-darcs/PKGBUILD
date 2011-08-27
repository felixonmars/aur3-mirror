# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-sipsimple-darcs
_pkgname=python-sipsimple
pkgver=20110513
pkgrel=1
pkgdesc="Python SDK for development of SIP end-points"
license=('MIT')
arch=('i686' 'x86_64')
url="http://download.ag-projects.com/SipClient"
depends=('python26-cython0113' 'openssl' 'gnutls' 'libxslt' 'python26-gnutls' 'python26-application'
         'python26-lxml' 'python26-eventlet' 'python26-greenlet' 'python26-cjson' 'python26-dnspython'
         'python26-twisted' 'python26-zope-interface' 'python26-imaging' 'python26-dateutil')
makedepends=('subversion' 'darcs')
options=('!makeflags')

_darcstrunk="http://devel.ag-projects.com/repositories"
_darcsmod="python-sipsimple"

build() {
 if [[ -d $_darcsmod/_darcs ]]; then
  msg "Retrieving missing patches"
  cd $_darcsmod
  darcs pull -a $_darcstrunk/$_darcsmod
 else
  msg "Retrieving complete sources"
  darcs get --lazy $_darcstrunk/$_darcsmod
  cd $_darcsmod
 fi

 python26 setup.py build
}

package() {
 cd "$srcdir/$_darcsmod"
 python26 setup.py install --root="$pkgdir" --optimize=1
}
