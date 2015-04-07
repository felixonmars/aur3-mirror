# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=pyromaths
pkgver=15.02
pkgrel=2
pkgdesc="Generates math exercises with LaTeX/Pstricks (only in french)"
url='http://www.pyromaths.org/'
license=('GPL2') 
arch=('any')
depends=('python2' 'python2-pyqt4' 'python2-lxml' 'python2-setuptools'
         'texlive-pstricks' 'texlive-latexextra' 'texlive-pictures')
source=(http://www.pyromaths.org/telecharger/$pkgname-${pkgver}-sources.tar.bz2)
md5sums=('f2cc73cbb910ac7f90023f421ddfcf3b')


build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  rm setup.cfg
  #chmod o+r ${srcdir}/${pkgname}-${pkgver}/data/packages/tabvar.tex
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root="$pkgdir" --prefix=/usr
}

