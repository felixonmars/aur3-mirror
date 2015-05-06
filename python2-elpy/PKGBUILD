# Maintainer: Renato Garcia <fgarcia.renato@gmail.com>

pkgname=python2-elpy
pkgver=1.8.0
pkgrel=1
epoch=1
pkgdesc="Package to bring powerful Python editing to Emacs. Python library only."
install="python2-elpy.install"
arch=('any')
url="https://github.com/jorgenschaefer/elpy"
license=('GPL')
depends=('python2' 'python2-flake8')
options=(!emptydirs)
source=("https://github.com/jorgenschaefer/elpy/archive/v${pkgver}.tar.gz")
md5sums=('20f0e87800a9c01dec267d65d8fba8a8')

package() {
  cd "${srcdir}/elpy-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
