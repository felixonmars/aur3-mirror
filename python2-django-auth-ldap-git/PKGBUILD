# Contributor: Alexis Metaireau
pkgname='python2-django-auth-ldap-git'
_gitname='django-auth-ldap'
pkgver=6646117
pkgrel=1
pkgdesc="Django authentication backend that authenticates against an LDAP service"
url="http://github.com/ametaireau/django-auth-ldap"
arch=('any')
license=('GPL3')
depends=('python2' 'python2-django' 'python2-ldap')
branch=master
source=("git+https://github.com/ametaireau/django-auth-ldap.git#branch=${branch}")
md5sums=('SKIP')

_gitname="django-auth-ldap"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_gitname"
  python2 setup.py build || return 1
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root=$pkgdir || return 1 
}
