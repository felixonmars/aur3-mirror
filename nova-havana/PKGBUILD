# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=nova-havana
_pkgname=nova
_relname=havana
pkgver=2013.2.3
pkgrel=2
pkgdesc="OpenStack cloud computing fabric controller"
arch=(any)
install=nova.install
url=https://launchpad.net/nova
license=(custom)
depends=('python2-pbr>=0.5.21'
         'python2-pbr<1.0'
         'python2-sqlalchemy-havana>=0.7.8'
         'python2-sqlalchemy-havana<0.7.99'
         'python2-amqplib>=0.6.1'
         'python2-anyjson>=0.3.3'
         'python2-argparse'
         'python2-boto>=2.4.0'
         'python2-eventlet>=0.13.0'
         'python2-jinja'
         'python2-kombu>=2.4.8'
         'python2-lxml>=2.3'
         'python2-routes>=1.12.3'
         'python2-webob-havana>=1.2.3'
         'python2-webob-havana<1.3'
         'python2-greenlet>=0.3.2'
         'python2-paste-deploy>=1.5.0'
         'python2-paste'
         'python2-migrate-havana>=0.7.2'
         'python2-netaddr'
         'python2-suds>=0.4'
         'python2-paramiko>=1.8.0'
         'python2-pyasn1'
         'python2-babel>=1.3'
         'python2-iso8601>=0.1.8'
         'python2-jsonschema>=1.3.0'
         'python2-cinderclient>=1.0.6'
         'python2-keystoneclient>=0.3.2'
         'python2-six>=1.4.1'
         'python2-stevedore>=0.10'
         'websockify-openstack>=0.5.1'
         'websockify-openstack<0.6'
         'python2-oslo-config>=1.2.0'
         'python2-carrot'
         'python2-cheetah'
         'python2-daemon'
         'python2-feedparser'
         'python2-gflags'
         'python2-lockfile'
         'python2-novaclient')
makedepends=(python2-setuptools)
source=("$url/$_relname/$pkgver/+download/$_pkgname-$pkgver.tar.gz"
        "nova-api.service"
        "nova-cert.service"
        "nova-conductor.service"
        "nova-consoleauth.service"
        "nova-novncproxy.service"
        "nova-scheduler.service"
        "nova_sudoers")
md5sums=('58a1d6005f9819ed9d5c70293fcc7493'
         '8e400161328001ff89cc7ea59a84cfe2'
         '6e11f7245b10e39ed024a512108ae95c'
         '5e8770c7b964fc82dbb6758688088ad9'
         'ffd28c32938c99232a8a3de5ab95f6d5'
         '52d6eadb4150289497b44a82552bfab0'
         '390100b8adaf92df13f660cc451b2f01'
         'b166058b5c25d0d7851adf30c2356691')

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
    cp ${srcdir}/nova_sudoers "${pkgdir}"/etc/sudoers.d/nova_sudoers
    mv "${pkgdir}"/etc/nova/nova.conf.sample "${pkgdir}"/etc/nova/nova.conf
    install -d -m 0770 ${pkgdir}/var/lib/nova/
    install -d -m 0770 ${pkgdir}/var/log/nova/
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
    install -D -m 644 ${srcdir}/nova-api.service ${pkgdir}/usr/lib/systemd/system/nova-api.service
    install -D -m 644 ${srcdir}/nova-cert.service ${pkgdir}/usr/lib/systemd/system/nova-cert.service
    install -D -m 644 ${srcdir}/nova-conductor.service ${pkgdir}/usr/lib/systemd/system/nova-conductor.service
    install -D -m 644 ${srcdir}/nova-consoleauth.service ${pkgdir}/usr/lib/systemd/system/nova-consoleauth.service
    install -D -m 644 ${srcdir}/nova-novncproxy.service ${pkgdir}/usr/lib/systemd/system/nova-novncproxy.service
    install -D -m 644 ${srcdir}/nova-scheduler.service ${pkgdir}/usr/lib/systemd/system/nova-scheduler.service
}
