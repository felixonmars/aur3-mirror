# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Linmiao Xu <linmiao.xu@gmail.com>
# Contributor: Tnoo <archtnoo at tnoo dot net>

pkgname=python2-openopt
_pythonname=openopt
pkgver=0.5501
pkgrel=1
arch=('any')
url='http://www.openopt.org'
license=('BSD')
pkgdesc='Optimization library'
depends=('python2' 'python2-numpy')
conflicts=('python-openopt')
source=("https://pypi.python.org/packages/source/o/${_pythonname}/${_pythonname}-${pkgver}.tar.gz")

package() {
  cd "$srcdir/${_pythonname}-${pkgver}"

  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -D -m 644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING.txt"
}

md5sums=('712f522c165f3770dc3239e52eae2f2d')
sha256sums=('6befc8534ba10c910124cfccc1891f61111636e164eb196c37511a2bbfead50b')
