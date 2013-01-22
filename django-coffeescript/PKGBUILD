# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=django-coffeescript
pkgver=0.7.1
pkgrel=1
pkgdesc="Django template tags to compile CoffeeScript"
arch=('any')
url="https://github.com/andreyfedoseev/django-coffeescript"
license=('BSD')
depends=('python2' 'coffee-script')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('22b2de27d5435c3f74994e240e52f08e')

package() {
  cd ${pkgname}-${pkgver}
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:""" % params)
