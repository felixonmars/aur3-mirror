# Maintainer: Raymond Smith <raymondbarrettsmith at gmail dot com>
# Contributor: Nicolas Barbey <nicolas.a.barbey@gmail.com>
# Contributor: <oslik@defender.inet>
pkgname=python2-sumatra
pkgver=0.6.0
pkgrel=1
pkgdesc="Sumatra is a tool for managing and tracking projects based on numerical simulation or analysis"
arch=('x86_64' 'i686')
url="http://neuralensemble.org/trac/sumatra/"
license=('Custom:CeCILL')
#depends=('python2' 'python2-httplib2' 'python2-gitpython'
#        'python2-django' 'django-tagging' 'python2-docutils')
#optdepends=('pysvn-py2: svn support')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('pysvn-py2: svn support'
            'python2-gitpython: git support'
            'python2-httplib2: web-interface'
            'python2-django: web-interface'
            'django-tagging: web-interface'
            'python2-docutils: web-interface')
source=("http://pypi.python.org/packages/source/S/Sumatra/Sumatra-${pkgver}.tar.gz")
sha256sums=('62026a96c0b8c3f701125900940dc1113cf85e5a0f202fec8fb71310e7fbd6fb')

package() {
  cd "${srcdir}/Sumatra-${pkgver}"
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
  install -Dm644 "${srcdir}/Sumatra-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et tw=0:
