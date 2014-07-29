# Contributor: Thomas Dziedzic <gostrc@gmail.com>

pkgname=python2-apns-client
_pkgname=apns-client
pkgver=0.2.1
pkgrel=1
pkgdesc='APNS library for python2'
arch=('any')
url='https://bitbucket.org/sardarnl/apns-client'
license=('APACHE')
depends=('python2' 'python2-six' 'python2-pyopenssl')
makedepends=('mercurial')

build() {
  hg clone https://bitbucket.org/sardarnl/apns-client

  cd ${_pkgname}

  python2 setup.py build
}

package() {
  cd ${_pkgname}

  python2 setup.py install --root="${pkgdir}" --optimize=1
}
