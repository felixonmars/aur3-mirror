# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=cinder-havana
_pkgname=cinder
_relname=havana
pkgver=2013.2.3
pkgrel=1
pkgdesc="OpenStack Block Storage Service"
arch=(any)
install=cinder.install
url=https://launchpad.net/cinder
license=(custom)
depends=('python2-pbr>=0.5.21'
         'python2-pbr<1.0'
         'python2-amqplib>=0.6.1'
         'python2-anyjson>=0.3.3'
         'python2-argparse'
         'python2-babel>=1.3'
         'python2-eventlet>=0.13.0'
         'python2-greenlet>=0.3.2'
         'python2-iso8601>=0.1.8'
         'python2-kombu>=2.4.8'
         'python2-lockfile>=0.8'
         'python2-lxml>=2.3'
         'python2-netaddr'
         'python2-oslo-config>=1.2.0'
         'python2-paramiko>=1.8.0'
         'python2-paste'
         'python2-paste-deploy>=1.5.0'
         'python2-glanceclient-havana>=0.9.0'
         'python2-keystoneclient>=0.3.2'
         'python2-novaclient>=2.15.0'
         'python2-swiftclient-havana>=1.5'
         'python2-routes>=1.12.3'
         'python2-six>=1.4.1'
         'python2-sqlalchemy-havana>=0.7.8'
         'python2-sqlalchemy-havana<0.7.99'
         'python2-migrate-havana>=0.7.2'
         'python2-stevedore>=0.10'
         'python2-suds>=0.4'
         'python2-webob-havana>=1.2.3'
         'python2-webob-havana<1.3'
         'python2-wsgiref>=0.1.2')
makedepends=(python2-setuptools)
source=("${url}/${_relname}/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz"
        "cinder-api.service"
        "cinder-volume.service"
        "cinder-scheduler.service"
        "cinder_sudoers"
       )
md5sums=('6de5507ea02687e0489b2a1472ba6fb4'
         'e06018fec46149db7c7e2e06d019bf60'
         'b2a5798bb63b8d12d958a0505405b20d'
         '1e96e2c0996d0d1340351b0d4eadcf96'
         '0ec0ec06bc4b2e886f9e33d11dfd8758')

build() {
    cd ${_pkgname}-${pkgver}/
    python2 setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}/
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -d "${pkgdir}"/etc/
    cp -r etc/ "${pkgdir}"/
    install -d -m 0750 "${pkgdir}"/etc/sudoers.d/
    cp ${srcdir}/cinder_sudoers "${pkgdir}"/etc/sudoers.d/cinder_sudoers
    mv "${pkgdir}"/etc/cinder/cinder.conf.sample "${pkgdir}"/etc/cinder/cinder.conf
    install -d -m 0770 ${pkgdir}/var/lib/cinder/
    install -d -m 0770 ${pkgdir}/var/log/cinder/
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
    install -D -m 644 ${srcdir}/cinder-api.service ${pkgdir}/usr/lib/systemd/system/cinder-api.service
    install -D -m 644 ${srcdir}/cinder-volume.service ${pkgdir}/usr/lib/systemd/system/cinder-volume.service
    install -D -m 644 ${srcdir}/cinder-scheduler.service ${pkgdir}/usr/lib/systemd/system/cinder-scheduler.service
}
