# Submitter: fsckd <fsckdaemon@gmail.com>
# Maintainer: numeral <numerical@gmail.com>


pkgname=python2-mezzanine
pkgver=3.0.9
pkgrel=1
pkgdesc="An open source content management platform built using the Django framework"
arch=('any')
license=('BSD')
url="http://mezzanine.jupo.org/"
depends=('python2'
         'python2-django'
         'python2-imaging'
         'python2-django-grappelli-safe'
         'python2-django-filebrowser-safe'
         'python2-bleach'
         'python2-pytz'
         'python2-south')
makedepends=('python2-distribute')
optdepends=('mysql-python: for MySQL backend'
            'python2-psycopg2: for PostgreSQL backend')
source=("http://pypi.python.org/packages/source/M/Mezzanine/Mezzanine-${pkgver}.tar.gz")
md5sums=('a4b15a937f180e8e10205b7f87f54813')
sha256sums=('c52bdb94752eb1b4dd3eb69c0a43dc630f3b05625fabc3775e094a706e9c70cf')

build() {
  cd "${srcdir}/Mezzanine-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/Mezzanine-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}
