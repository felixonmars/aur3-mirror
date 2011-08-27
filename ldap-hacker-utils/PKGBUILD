# Contributor: Luka Perkov <ldap-hacker-utils <at> lukaperkov <dOt> net>

pkgname=ldap-hacker-utils
pkgver=0.1.0
pkgrel=1
pkgdesc="ldap-hacker-utils exploits weak LDAP deployments."
url="http://lukaperkov.net/"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('python' 'python-ldap' 'pybruteforce')
source=(http://code.lukaperkov.net/${pkgname}-${pkgver}.tar.gz)

md5sums=('168c90299a81ad49e659f9ec8105deb1')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  python setup.py config || return 1
  python setup.py build || return 1
  python setup.py install --root=${startdir}/pkg --optimize=2 || return 1
}
