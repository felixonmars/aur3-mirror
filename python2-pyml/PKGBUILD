# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: David Pretty <david.pretty@gmail.com> 

pkgname=python2-pyml
pkgver=0.7.9
pkgrel=1
pkgdesc='An interactive object oriented framework for machine learning written in Python'
arch=('i686' 'x86_64')
license=('LGPL')
url='http://pyml.sourceforge.net/'
depends=('python2-numpy' 'python2-matplotlib')
source=("http://downloads.sourceforge.net/pyml/PyML-${pkgver}.tar.gz")
md5sums=('1d42df4ed57b90509b4c5695cbcccbb2')

build() {
  cd PyML-${pkgver}

  python2 setup.py build
}

package() {
  cd PyML-${pkgver}

  python2 setup.py install \
    --root=${pkgdir} \
    --optimize=1
}
