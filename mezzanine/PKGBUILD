# Submitter: fsckd <fsckdaemon@gmail.com>
# Maintainer: numeral <numerical@gmail.com>


pkgname=mezzanine
pkgver=1.4.3
pkgrel=1
pkgdesc="An open source content management platform built using the Django framework"
arch=('any')
license=('BSD')
url="http://mezzanine.jupo.org/"
depends=('python2' 
         'django' 
         'python2-imaging' 
         'django-grappelli-safe' #
         'django-filebrowser-safe' # 
         'python2-bleach' #
         'python2-pytz'
         'python2-south')
makedepends=('python2-distribute')
optdepends=('mysql-python: for MySQL backend'
            'python2-psycopg2: for PostgreSQL backend')
source=("http://pypi.python.org/packages/source/M/Mezzanine/Mezzanine-${pkgver}.tar.gz")
md5sums=('02029ce0f9cd664d7b0e6d30243e74ce')
sha256sums=('d49cb0df12f8decc5f6f0a71410e7e7394598ac56aeaed82a10919f05b4e4fed')

build() {
  cd "${srcdir}/Mezzanine-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/Mezzanine-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}
