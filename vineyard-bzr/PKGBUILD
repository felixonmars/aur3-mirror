# Maintainer: # Maintainer: crazyelf5

pkgname=vineyard-bzr
pkgver=latest
pkgrel=1
pkgdesc="Easy to use Wine configuration programs and libraries"
arch=('i686' 'x86_64')
url="https://launchpad.net/vineyard"
license=('GPLv3' 'LGPLv2.1')
depends=('python2' 'wine')
makedepends=('bzr')
provides=('vineyard' 'python-wine')
conflicts=('vineyard' 'python-wine')
install=${pkgname}.install

_bzrtrunk=lp:vineyard
_bzrmod=vineyard

build() {
  cd "${srcdir}"
  msg "Connecting to the server...."

  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrtrunk} ${_bzrmod} 
  else
    bzr up ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ${_bzrmod}-build ] && rm -rf ${_bzrmod}-build
  cp -r ${_bzrmod} ${_bzrmod}-build
  cd ${_bzrmod}-build
  
  # Sed for Python2
  sed -e "s_env python_&2_;s_bin/python_&2_" \
      -i `egrep -rl "(env python|bin/python)" .`
}

package() {
  cd "${srcdir}"/${_bzrmod}-build
  python2 ./setup.py install --root="${pkgdir}"
}
