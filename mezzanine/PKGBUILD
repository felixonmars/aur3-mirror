# Maintainer: fsckd <fsckdaemon@gmail.com>

pkgname=mezzanine
pkgver=1.3.0
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
md5sums=('358e7a0d0035d54b704597748f713fe2')
sha256sums=('5023b542d6181e87a4c0734df4742b6433b89254ecd8e1438845e78e32d1ac80')

build() {
  cd "${srcdir}/Mezzanine-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/Mezzanine-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}
