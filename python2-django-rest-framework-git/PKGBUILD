# Maintainer: Dominik Kozaczko <aur@kozaczko.info>
# Contributor: Jeremy Audet <Ichimonji10@gmail.com>

# epoch=1 because previous version used date

pkgname='python2-django-rest-framework-git'
_repo='django-rest-framework'
epoch=1
pkgver=2.3.14.78.gc52075f
pkgrel=1
pkgdesc="Django REST framework is a lightweight REST framework for Django, that aims to make it easy to build well-connected, self-describing RESTful Web APIs. Python2 version, git fresh."
arch=(any)
url="http://django-rest-framework.org/"
license=('BSD')
depends=('python2' 'python2-django' 'python2-urlobject')
makedepends=('git')
optdepends=('python2-markdown: Markdown support' 'python2-yaml: YAML support ')
conflicts=('python2-django-rest-framework')
provides=('python2-django-rest-framework')
replaces=('django-rest-framework-git')
md5sums=('SKIP')
sha256sums=('SKIP')
source=('git://github.com/tomchristie/django-rest-framework.git')

pkgver() {
    cd "$_repo"
    git describe --always | sed 's/-/./g'
}


build() {
    cd "$srcdir/$_repo"
    python2 setup.py build
}


package() {
  cd "$srcdir/$_repo"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

