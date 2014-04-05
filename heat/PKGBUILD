# Maintainer: Lance Chen <cyen0312+aur@gmail.com>

pkgname=heat
pkgver=2013.2.3
pkgrel=1
pkgdesc="OpenStack orchestration service"
epoch=$(date +%Y%m%d)
arch=(any)
url="https://launchpad.net/heat"
license=('Apache')
backup=('etc/heat/heat.conf')
depends=('libgcrypt'
         'python2'
         'python2-setuptools'
         'python2-babel>=1.3'
         'python2-eventlet>=0.13.0'
         'python2-greelet>=0.3.2'
         'python2-httplib2'
         'python2-iso8601>=0.1.8'
         'python2-kombu>=2.4.8'
         'python2-lxml>=2.3'
         'python2-netaddr'
         'python2-oslo-config>=1.2.0'
         'python2-paramiko>=1.8.0'
         'python2-paste-deploy>=1.5.0'
         'python2-pbr>=0.5.21'
         'python2-pbr<1.0'
         'python2-crypto>=2.6'
         'python2-ceilometerclient>=1.0.5'
         'python2-cinderclient>=1.0.6'
         'python2-keystoneclient>=0.3.2'
         'python2-neutronclient>=2.3.0'
         'python2-neutronclient<3.0.0'
         'python2-novaclient>=2.15.0'
         'python2-swiftclient>=1.5'
         'python2-yaml>=3.1.0'
         'python2-routes>=1.12.3'
         'python2-six>=1.4.1'
         'python2-sqlalchemy-0.7.9'
         'python2-migrate>=0.7.2'
         'python2-webob>=1.2.3'
         'python2-webob<1.3')
makedepends=('python2-setuptools'
             'python2-sphinx'
             'python2-oslo-sphinx')
options=('emptydirs')
install=heat.install
source=("$url/havana/2013.2.3/+download/$pkgname-$pkgver.tar.gz"
        "heat-api-cfn.service"
        "heat-api-cloudwatch.service"
        "heat-api.service"
        "heat-engine.service")
md5sums=('cf486d7523d73d82ad9106add3d9e1ec'
         'a7747fecc6f41b83d99546621a06c908'
         'c6f4029de260543c368ac350197ff5c5'
         '6c6a28babfbd260970b76622b489f762'
         'e857128655cb34fb53af278f74e45010')

build() {
  cd "$pkgname-$pkgver"
  /usr/bin/python2 setup.py build
  #/usr/bin/python2 -d setup.py build_sphinx
  /usr/bin/python2 setup.py install --root="$srcdir/tmp" \
                                    --install-data="/" \
                                    --optimize=1
  cp -R etc/ "$srcdir/tmp/"
}

package() {
  cd tmp

  install -d "${pkgdir}/etc/heat/"
  cp -R etc/heat/ "${pkgdir}/etc/"
  install -m 644 etc/heat/heat.conf.sample "${pkgdir}/etc/heat/heat.conf"

  install -d "${pkgdir}/usr/bin/"
  cp -R usr/bin/ "${pkgdir}/usr/"

  install -d "${pkgdir}/usr/lib/"
  cp -R usr/lib/ "${pkgdir}/usr/"

  install -d "${pkgdir}/usr/lib/systemd/system/"
  install -m 644 "${srcdir}/heat-api-cfn.service" \
                 "${pkgdir}/usr/lib/systemd/system/heat-api-cfn.service"
  install -m 644 "${srcdir}/heat-api-cloudwatch.service" \
                 "${pkgdir}/usr/lib/systemd/system/heat-api-cloudwatch.service"
  install -m 644 "${srcdir}/heat-api.service" \
                 "${pkgdir}/usr/lib/systemd/system/heat-api.service"
  install -m 644 "${srcdir}/heat-engine.service" \
                    "${pkgdir}/usr/lib/systemd/system/heat-engine.service"

  install -d -m 0770 "${pkgdir}/var/lib/heat/"
  install -d -m 0770 "${pkgdir}/var/log/heat/"
}

# vim:set sw=2 sts=2 et:
