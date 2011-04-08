# Contributor: Renato Coutinho <renato.coutinho@gmail.com>
pkgname=python2-garlicsim
pkgver=0.6.3
pkgrel=1
pkgdesc="Pythonic framework for computer simulations."
arch=('i686' 'x86_64')
url="http://garlicsim.org/"
license=('LGPL')
depends=('python2' 'wxpython')
makedepends=('setuptools')
optdepends=('python2-numpy'
            'psyco'
            'python2-nose')

source=(http://pypi.python.org/packages/source/g/garlicsim/garlicsim-${pkgver}.tar.gz
        http://pypi.python.org/packages/source/g/garlicsim_lib/garlicsim_lib-${pkgver}.tar.gz
        http://pypi.python.org/packages/source/g/garlicsim_wx/garlicsim_wx-${pkgver}.tar.gz)

build() {
   cd ${srcdir}/garlicsim-${pkgver}
   python2 setup.py install --prefix=/usr --root=${pkgdir} || return 1
   cd ${srcdir}/garlicsim_lib-${pkgver}
   python2 setup.py install --prefix=/usr --root=${pkgdir} || return 1
   cd ${srcdir}/garlicsim_wx-${pkgver}
   python2 setup.py install --prefix=/usr --root=${pkgdir} || return 1
}

md5sums=('9d39b7c5e0541ff326e51be40bf71c4d'
         'f0958f2675e3c4bb882f4b96b8fa857a'
         '2af38a20c54ede1b8e5e6da47becc3e8')
