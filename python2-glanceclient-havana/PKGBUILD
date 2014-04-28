# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=python2-glanceclient-havana
_pkgname=python2-glanceclient
pkgver=0.12.0
pkgrel=1
pkgdesc="OpenStack image service client libs"
arch=(any)
url=https://launchpad.net/glance
license=(custom)
depends=('python2-greenlet>=0.3.2'
         'python2-sqlalchemy-havana>=0.7.8'
         'python2-sqlalchemy-havana<0.7.99'
         'python2-anyjson>=0.3.3'
         'python2-eventlet>=0.13.0'
         'python2-paste-deploy>=1.5.0'
         'python2-paste'
         'python2-routes>=1.12.3'
         'python2-webob-havana>=1.2.3'
         'python2-webob-havana<1.3.0'
         'python2-wsgiref>=0.1.2'
         'python2-migrate-havana>=0.7.2'
         'python2-httplib2'
         'python2-kombu>=2.4.8'
         'python2-crypto>=2.6'
         'python2-iso8601>=0.1.8'
         'python2-lxml>=2.3'
         'python2-passlib'
         'python2-netaddr'
         'python2-sendfile'
         'python2-xattr')
makedepends=(python2-setuptools)
source=(https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname//2}/${_pkgname//2}-$pkgver.tar.gz)
md5sums=('8eddc27a90121c3d2ca6f6141de30f0d')

prepare() {
    find ${_pkgname//2}-$pkgver -type f -exec sed -ri 's:^#!/usr/bin/(env )?python$:&2:' '{}' \;
}

build() {
    cd ${_pkgname//2}-$pkgver/
    python2 setup.py build
}

package() {
    cd ${_pkgname//2}-$pkgver/
    python2 setup.py install --root="$pkgdir"
}
