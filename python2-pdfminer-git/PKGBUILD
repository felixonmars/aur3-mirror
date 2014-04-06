
#Maintainer:Kwrazi<kwrazi@gmail.com>

_pkgname=pdfminer
pkgname=python2-${_pkgname}-git
pkgver=20140402
pkgrel=1
pkgdesc="Python library and utils to extract & analyze text data of PDF files."
arch=('any')
url="http://www.unixuser.org/~euske/python/pdfminer/index.html"
license=('MIT/X')
depends=('python2')
makedepends=('git')
provides=(${_pkgname} 'python2-pdfminer')
conflicts=(${_pkgname} "${_pkgname}-svn")
source=('git+https://github.com/euske/pdfminer.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
  cd ${srcdir}/${_pkgname}

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

