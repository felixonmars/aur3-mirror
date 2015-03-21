# Submitter: fsckd <fsckdaemon@gmail.com>
# Contributor: numeral <numerical@gmail.com>
# Maintainer: Kniyl <mathias.ettinger@gmail.com>

pkgname=python-mezzanine
_pkgname=Mezzanine
pkgver=3.1.10
pkgrel=3
pkgdesc="An open source content management platform built using the Django framework"
arch=('any')
license=('BSD')
url="http://mezzanine.jupo.org/"
depends=('python'
         'python-django'
         'python-django-grappelli-safe'
         'python-django-filebrowser-safe'
         'python-tzlocal'
         'python-bleach'
         'python-beautifulsoup4'
         'python-requests'
         'python-requests-oauthlib'
         'python-future'
         'python-pillow')
makedepends=('python-distribute')
optdepends=('flake8: to run tests')
source=("http://pypi.python.org/packages/source/M/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('7e380eeb33bb84d0ea7455f8ab3b76c4')
sha256sums=('cd33d3dce112ae24fbb23ab2632334d124d3c35556fd2a3d87ec5916293a1705')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
