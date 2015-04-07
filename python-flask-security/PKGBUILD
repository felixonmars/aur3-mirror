# Maintainer: William Berglund <williamberraberglund@gmail.com>
pkgname=python-flask-security
_pyname=Flask-Security
pkgver=1.7.4
pkgrel=1
pkgdesc='Flask-Security quickly adds security features to your Flask application.'
arch=('any')
url='https://pythonhosted.org/Flask-Security/'
license=('MIT')
depends=('python' 'python-flask')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "LICENSE")
md5sums=('af2a12ab15e5d360fbb242a0305d6642'
         '3c28aab2dbdb5a536ebe9865746d61f8')
package() {

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

}
# vim:set ts=2 sw=2 et:
