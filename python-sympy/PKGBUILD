# Maintainer: Christian Bühler <christian@cbuehler.de>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>  
# Contributor: Peter Garceau <RockyChimp@gmail.com>

pkgname=python-sympy
pkgver=0.7.2
pkgrel=1
arch=('any')
pkgdesc='Symbolic manipulation package (Computer Algebra System), written in pure Python'
url='http://sympy.org/en/index.html'
license=('BSD')
depends=('python')
optdepends=('pyglet: plotting'
            'ipython: user friendly interface for isympy')
source=("http://sympy.googlecode.com/files/sympy-${pkgver}-py3.2.tar.gz")
md5sums=('a90621bf4c0678c35e67ed62a56196f1')

build() {
  cd sympy-${pkgver}
  python setup.py build
}

check() {
  cd sympy-${pkgver}
  python setup.py test
}

package() {
  cd sympy-${pkgver}

  python setup.py install --root ${pkgdir} --optimize=1

  install -D -m644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
