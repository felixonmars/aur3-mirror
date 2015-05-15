# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname=python-paver
pkgver=1.2.4
pkgrel=1
pkgdesc="Build, Distribute and Deploy Python Projects"
arch=('i686' 'x86_64')
url="http://www.blueskyonmars.com/projects/paver/"
license=('BSD')
depends=('python')
source=("http://pypi.python.org/packages/source/P/Paver/Paver-${pkgver}.tar.gz")
md5sums=('dbb94faf8b004eb9920b632808c20560')

package() {
  cd "${srcdir}/Paver-${pkgver}"
  python setup.py install --prefix="${pkgdir}/usr"
  install -D "${srcdir}/Paver-${pkgver}/LICENSE.txt" \
             "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
