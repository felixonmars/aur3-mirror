# Contributor: Low Kian Seong <kianseong@gmail.com>
pkgname='python-flask-actions'
pkgver='0.6.4'
pkgrel='2'
pkgdesc='custom actions for flask to help manage your application'
arch=('any')
url='http://pypi.python.org/pypi/Flask-Actions/'
license=('BSD')
depends=('python2' 'python-werkzeug' 'python-flask')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/F/Flask-Actions/Flask-Actions-${pkgver}.tar.gz")
md5sums=('e3393f34fb475de42b7ae37d2fb14198')

build() {
  cd "${srcdir}/Flask-Actions-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --prefix="/usr" || return 1
}



# vim:set ts=2 sw=2 et:
