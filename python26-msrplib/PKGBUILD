# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-msrplib
_pkgname=python-msrplib
pkgver=20110513
pkgrel=1
pkgdesc="A python client library for the MSRP client"
license=('MIT')
arch=('any')
url="http://download.ag-projects.com/SipClient"
depends=('python26')
makedepends=('darcs')

_darcstrunk="http://devel.ag-projects.com/repositories"
_darcsmod="python-msrplib"

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

 python26 setup.py install --root="$pkgdir" --optimize=1
}
