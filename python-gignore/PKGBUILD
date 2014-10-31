# Maintainer: Alireza Savand <alireza.savand@gmail.com>

pkgname=python-gignore
_pkgname=gignore
pkgver=2014.10.28
pkgrel=1
pkgdesc="Get .gitignore files from github.com/github/gitignore"
arch=(any)
url="https://github.com/Alir3z4/python-gignore"
license=('BSD')
depends=('python')
source=(https://pypi.python.org/packages/source/g/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
options=(!emptydirs)
md5sums=('e624ade589817e256fceb50079b7f903')

build() {
  cd ${srcdir}/${_pkgname}-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/"${_pkgname}"-$pkgver
  python setup.py install --root="$pkgdir/"
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 README.rst "$pkgdir/usr/share/doc/${_pkgname}/README.rst"
  install -Dm644 ChangeLog.rst "$pkgdir/usr/share/doc/${_pkgname}/ChangeLog.rst"
}
