# Maintainer: fsckd <fsckdaemon@gmail.com>

pkgname=mezzanine
pkgver=1.2.4
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
md5sums=('6d82fe15bb58120415ac821bdd5696a8')
sha256sums=('7419eddf59a9031703952249fc724ac595cf354f9e23de0882d8903b41345a74')

build() {
  cd "${srcdir}/Mezzanine-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/Mezzanine-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}
