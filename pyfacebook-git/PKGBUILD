# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>

_pkgname=pyfacebook
pkgname=pyfacebook-git
pkgver=r386.ebc4e7c
pkgrel=1
pkgdesc="A thin wrapper for accessing Facebook's RESTful API through Python."
arch=('any')
url="http://github.com/sciyoshi/pyfacebook/"
license=('GPL')
depends=('python2-django')
makedepends=('git' 'python2-distribute')
provides=('python2-facebook')
conflicts=('python2-facebook')
source=(git://github.com/sciyoshi/pyfacebook.git)
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"

  python2 setup.py build
}

package() {
  cd "$_pkgname"

  python2 setup.py install --root=${pkgdir} --prefix=/usr
} 
