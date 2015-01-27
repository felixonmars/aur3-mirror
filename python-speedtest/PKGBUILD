# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu> 
pkgname=python-speedtest
pkgver=0.3.1
pkgrel=1
pkgdesc="Command line interface for testing internet bandwidth using speedtest.net"
arch=('any')
url="https://github.com/sivel/speedtest-cli"
license=('APACHE')
depends=('python')
source=(https://pypi.python.org/packages/source/s/speedtest-cli/speedtest-cli-${pkgver}.tar.gz)
sha256sums=('ca9bdae4c130ba855d474fe5f56127179eda95a891419a0ebc69c0a9577ec252')

package() {
  cd "${srcdir}/speedtest-cli-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
