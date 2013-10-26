# Maintainer: Lance Chen <cyen0312+aur@gmail.com>

pkgbase=keystone
pkgname=keystone
true && pkgname=('keystone' 'python2-keystone')
pkgver=2013.2.rc4
pkgrel=1
pkgdesc="OpenStack Identity"
arch=(any)
url="https://launchpad.net/keystone"
license=('Apache')
depends=('python2' 'python2-setuptools')
makedepends=('python2-setuptools' 'python2-sphinx' 'python2-oslo-sphinx')
options=('emptydirs')
install=keystone.install
source=("$url/havana/havana-rc4/+download/$pkgbase-$pkgver.tar.gz"
        "keystone.service")
md5sums=('86f9c220a08386d16abafef386c64a9b'
         'c3ddbede14b4c937c3da77c81b817345')

build() {
  cd "$pkgbase-$pkgver"
  /usr/bin/python2 setup.py build
  /usr/bin/python2 -d setup.py build_sphinx
  /usr/bin/python2 setup.py install --root="$srcdir/tmp" \
                                    --install-data="/" \
                                    --optimize=1
  cp -R etc/ $srcdir/tmp/
  cp -R doc/build/man/ $srcdir/tmp/
}

package_keystone() {
  pkgdesc+=" - Daemon"
  depends=('python2-keystone')
  backup=('etc/keystone/keystone.conf')

  cd tmp

  install -d ${pkgdir}/etc/keystone/
  install -m 644 etc/default_catalog.templates ${pkgdir}/etc/keystone/default_catalog.templates
  install -m 644 etc/keystone.conf.sample ${pkgdir}/etc/keystone/keystone.conf
  install -m 644 etc/keystone-paste.ini ${pkgdir}/etc/keystone/
  install -m 644 etc/logging.conf.sample ${pkgdir}/etc/keystone/logging.conf
  install -m 644 etc/policy.json ${pkgdir}/etc/keystone/
  install -m 644 etc/policy.v3cloudsample.json ${pkgdir}/etc/keystone/
  
  install -d ${pkgdir}/usr/bin/
  install -m 755 usr/bin/keystone-all ${pkgdir}/usr/bin/
  install -m 755 usr/bin/keystone-manage ${pkgdir}/usr/bin/

  install -d ${pkgdir}/usr/share/man/man1/
  install -m 644 man/keystone-all.1 ${pkgdir}/usr/share/man/man1/
  install -m 644 man/keystone-manage.1 ${pkgdir}/usr/share/man/man1/

  install -D -m 644 ${srcdir}/keystone.service ${pkgdir}/usr/lib/systemd/system/keystone.service

  install -d -m 0770 ${pkgdir}/var/lib/keystone/
  install -d -m 0770 ${pkgdir}/var/log/keystone/
}


package_python2-keystone() {
  pkgdesc+=" - Python library"
  depends=('python2-babel>=0.9.6'
           'python2-dogpile-cache>=0.5.0'
           'python2-eventlet>=0.13.0'
           'python2-greenlet>=0.3.2'
           'python2-iso8601>=0.1.4'
           'python2-keystoneclient>=0.3.2'
           'python2-lxml>=2.3'
           'python2-netaddr'
           'python2-oauth2'
           'python2-oslo-config>=1.2.0'
           'python2-pam>=0.1.4'
           'python2-passlib'
           'python2-paste'
           'python2-paste-deploy>=1.5.0'
           'python2-pbr>=0.5.21'
           'python2-pbr<1.0.0'
           'python2-routes>=1.12.3'
           'python2-sqlalchemy-0.7.9'
           'python2-webob>=1.2.3'
           'python2-webob<1.3.0')
  optdepends=('python2-pysqlite: optional backend'
              'python2-memcached: optional backend'
              'python2-ldap=2.3.13: optional backend')

  cd tmp

  install -d ${pkgdir}/usr/lib/
  cp -R usr/lib/ ${pkgdir}/usr/
}

# vim:set ts=2 sw=2 et:
