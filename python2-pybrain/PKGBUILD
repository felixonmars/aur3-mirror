# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=python2-pybrain
pkgver=0.3.1
pkgrel=1
pkgdesc='Modular Machine Learning Library for Python'
arch=('any')
url='http://pybrain.org/'
license=('BSD')
depends=('python2-scipy')
makedepends=('python2-distribute' 'git')
optdepends=('python2-matplotlib: for plotting')

build() {
  git clone git://github.com/pybrain/pybrain.git

  cd pybrain

  git checkout ${pkgver}

  python2 setup.py build
}

package() {
  cd pybrain

  python2 setup.py install --root=${pkgdir} --optimize=1

  install -d ${pkgdir}/usr/share/licenses/python2-pybrain
  install -m644 LICENSE \
    ${pkgdir}/usr/share/licenses/python2-pybrain
} 
