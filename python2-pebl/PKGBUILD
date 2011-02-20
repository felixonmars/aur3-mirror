# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=python2-pebl
pkgver=1.0.2
pkgrel=1
pkgdesc='Pebl is a python library and command line application for learning the structure of a Bayesian network given prior knowledge and observations.'
arch=('i686' 'x86_64')
url='http://code.google.com/p/pebl-project'
license=('MIT')
depends=('python2-numpy' 'pydot' 'python-simplejson')
source=("http://pebl-project.googlecode.com/files/pebl-${pkgver}.tar.gz")
md5sums=('cc656223e978a1b207782ecb5f387f86')

build() {
  cd pebl-${pkgver}

  python2 setup.py build
}

package() {
  cd pebl-${pkgver}

  python2 setup.py install \
    --root=${pkgdir} \
    --optimize=1
}

