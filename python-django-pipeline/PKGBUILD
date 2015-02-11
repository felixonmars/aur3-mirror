# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgbase='python-django-pipeline'
pkgname=('python-django-pipeline' 'python2-django-pipeline')
_pkgname='django-pipeline'
pkgver=1.4.5
pkgrel=1
pkgdesc="An asset packaging library for Django"
arch=('any')
url="https://github.com/cyberdelia/django-pipeline"
license=('MIT')
optdepends=("nodejs-yuglify: Pipeline's default CSS and JS compressor")
source=("https://pypi.python.org/packages/source/d/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
makedepends=('python2-setuptools' 'python-setuptools')
md5sums=('e849eb6c1bb5ce51606d5a4f9bcb227d')

package_python-django-pipeline() {
  depends=('python-django')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python2-django-pipeline() {
  depends=('python2-django' 'python2-futures')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
