# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=glance-havana
pkgver=2013.2.3
pkgrel=1
arch=(any)
url=https://launchpad.net/glance
license=('Apache')
depends=('python2-pbr>=0.5.21'
         'python2-pbr<1.0.0'
         'python2-greenlet>=0.3.2'
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
         'python2-argparse'
         'python2-boto>=2.4.0'
         'python2-migrate-havana>=0.7.2'
         'python2-httplib2'
         'python2-kombu>=2.4.8'
         'python2-crypto>=2.6'
         'python2-iso8601>=0.1.8'
         'python2-oslo-config>=1.2.0'
         'python2-swiftclient-havana>=1.5'
         'python2-swiftclient-havana<2.0.0'
         'python2-lxml>=2.3'
         'python2-passlib'
         'python2-jsonschema>=1.3.0'
         'python2-cinderclient>=1.0.6'
         'python2-keystoneclient>=0.3.2'
         'python2-pyopenssl>=0.11'
         'python2-six>=1.4.1')
makedepends=(python2-setuptools)
pkgdesc="OpenStack image registry and delivery service"
source=($url/havana/$pkgver/+download/glance-$pkgver.tar.gz
        'glance-api.service'
        'glance-registry.service')
md5sums=('385aea03a638948cba4a068fe8fa0eca'
         '264d67ff4e694e47029bfe9f718c29b7'
         'ca8fc3b6e84f6deb69e298abba883539')

prepare() {
    find glance-$pkgver -type f -exec sed -ri 's:^#!/usr/bin/(env )?python$:&2:' '{}' \;
}

build() {
    cd glance-$pkgver/
    python2 setup.py build
}

package() {
    cd glance-$pkgver/
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -d "$pkgdir"/etc/;install -d "$pkgdir"/var/log/glance/;install -d "$pkgdir"/usr/lib/systemd/system/;install -Dm644 ${startdir}/glance-api.service "$pkgdir"/usr/lib/systemd/system/glance-api.service;install -Dm644 ${startdir}/glance-registry.service "$pkgdir"/usr/lib/systemd/system/glance-registry.service
    cp -r etc/ "$pkgdir"/etc/glance/
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/glance/LICENSE
}
