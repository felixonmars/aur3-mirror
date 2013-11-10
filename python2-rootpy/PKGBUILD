# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
pkgname=python2-rootpy
pkgver=0.7.1
pkgrel=1
pkgdesc="A feature-rich pythonic interface with the ROOT libraries on top of the PyROOT bindings"
arch=('any')
url="http://www.rootpy.org/"
license=('GPL3')
depends=('python2' 'root')
optdepends=('python2-root_numpy: speed'
            'python2-matplotlib: plotting'
            'python2-pytables: root2hdf5'
            'readline: roosh'
            'python2-termcolor: roosh')
conflicts=('python2-rootpy-git')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/r/rootpy/rootpy-${pkgver}.tar.gz")
md5sums=('534aa282697d0659b2ee34c6a0f26297')

package() {
  cd "${srcdir}/rootpy-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
