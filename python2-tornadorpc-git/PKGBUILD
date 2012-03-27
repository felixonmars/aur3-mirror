# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=python2-tornadorpc-git
pkgver=20120327
pkgrel=1
pkgdesc='Python libraries for XML/JSON RPC using the Tornado framework.'
arch=('i686' 'x86_64')
url='https://github.com/joshmarshall/tornadorpc'
license=('unknown')
depends=('python2-tornado' 'python-cjson')

_gitroot='https://github.com/joshmarshall/tornadorpc.git'
_gitname='tornadorpc'

build() {
  if [ -d $_gitname ] ; then
    cd $_gitname
    git pull origin
  else
    git clone $_gitroot $_gitname
    cd $_gitname
  fi

  python2 setup.py build
}

check() {
  cd $_gitname
  
  python2 ./run_tests.py
}

package() {
  cd $_gitname

  python2 setup.py install --root=${pkgdir} --optimize=1
}
