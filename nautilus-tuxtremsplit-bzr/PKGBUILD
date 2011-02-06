# Maintainer: Wido <widomaker2k7@gmail.com>

pkgname=nautilus-tuxtremsplit-bzr
pkgver=132
pkgrel=1
pkgdesc="A nautilus extension for tuxtremsplit"
arch=('any')
url="https://launchpad.net/tuxtremsplit"
license=('GPL')
depends=('tuxtremsplit-bzr' 'nautilus' 'python-nautilus')
makedepends=('bzr')

_bzrtrunk="lp:tuxtremsplit"
_bzrmod="trunk"

build() {    
    cd ${srcdir}
    msg "Connecting to the server...."

  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrtrunk} ${_bzrmod} -r ${pkgver}
  else
    bzr up ${_bzrmod}
  fi

  [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build
  cd ./${_bzrmod}-build

  install -Dm755 ./data/nautilus_extension/nautilus-tuxtremsplit.py ${pkgdir}/usr/lib/nautilus/extensions-2.0/python/nautilus-tuxtremsplit.py || return 1
}
