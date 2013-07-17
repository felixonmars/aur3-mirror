# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: Chaoswizard <chaoswizard@gmail.com>
_name=feedgenerator
pkgname="python-${_name}"
pkgver=1.6
pkgrel=1
pkgdesc="Standalone version of django.utils.feedgenerator (python3)."
url="http://pypi.python.org/pypi/feedgenerator"
arch=('any')
license=('GPL')
depends=('python' 'python-pytz' 'python-six')
makedepends=('python-distribute')
source=("https://pypi.python.org/packages/source/f/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ec66b671a946381e02ee97b5f4746959c4bda960be4994ce39be5a7f5eb445fe')
         
package() {
  cd "${_name}-${pkgver}"
  python ./setup.py install --root="${pkgdir}"
}
