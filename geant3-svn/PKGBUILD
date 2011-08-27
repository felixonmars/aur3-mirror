pkgname=geant3-svn
pkgver=260
pkgrel=1
pkgdesc='Detector Description and Simulation Tool'
arch=('i686' 'x86_64')
url='http://wwwasd.web.cern.ch/wwwasd/geant'
license=('GPL')
depends=('root' 'plan9port')
makedepends=('subversion')

_svntrunk='https://root.cern.ch/svn/geant3/trunk/'
_svnmod='geant3'

build() {
  if [ -d ${_svnmod} ]; then
    cd ${_svnmod}
    svn up -r ${pkgver}
  else
    svn co ${_svntrunk} ${_svnmod} -r ${pkgver}
    cd ${_svnmod}
  fi

  export PLATFORM=linuxx8664gcc

  make
}

package() {
  cd ${_svnmod}/lib/*

  # Dirtah hack
  install -D -m777 libgeant321.so ${pkgdir}/usr/lib/libgeant321.so
}
