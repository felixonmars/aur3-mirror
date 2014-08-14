pkgname=python2-django-rest-framework
pipname=djangorestframework
pkgver=2.3.14
pkgrel=1
pkgdesc="Django REST framework is a lightweight REST framework for Django, that aims to make it easy to build well-connected, self-describing RESTful Web APIs. Python2 version."
arch=(any)
url="http://django-rest-framework.org/"
license=('BSD')
depends=('python2' 'python2-django' 'python2-urlobject')
makedepends=('python2-distribute')
optdepends=('python2-markdown: Markdown support' 'python2-yaml: YAML support ')
source=("http://pypi.python.org/packages/source/d/${pipname}/${pipname}-${pkgver}.tar.gz")
md5sums=('5515567dc032685a6d8b5239bd8fcf8b')
replaces=('django-rest-framework')
conflicts=('python2-django-rest-framework-git')

package() {
  cd "$srcdir/$pipname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

