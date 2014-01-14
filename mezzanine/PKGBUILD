# Submitter: fsckd <fsckdaemon@gmail.com>
# Maintainer: numeral <numerical@gmail.com>


pkgname=mezzanine
pkgver=3.0.5
pkgrel=1
pkgdesc="An open source content management platform built using the Django framework"
arch=('any')
license=('BSD')
url="http://mezzanine.jupo.org/"
depends=('python2'
         'python2-django'
         'python2-imaging'
         'django-grappelli-safe'
         'django-filebrowser-safe'
         'python2-bleach'
         'python2-pytz'
         'python2-south')
makedepends=('python2-distribute')
optdepends=('mysql-python: for MySQL backend'
            'python2-psycopg2: for PostgreSQL backend')
source=("http://pypi.python.org/packages/source/M/Mezzanine/Mezzanine-${pkgver}.tar.gz")
md5sums=('14b24b0ff5cbb15ed8a1398aef28bf86')
sha256sums=('fee6edab82c4b6babd69fc0aac388615225b4995d7c868782222eec9d75ca625')

build() {
  cd "${srcdir}/Mezzanine-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/Mezzanine-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}
