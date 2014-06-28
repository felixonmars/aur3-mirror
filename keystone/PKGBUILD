# Maintainer: Lance Chen <cyen0312+aur@gmail.com>

pkgbase=keystone
pkgname=('keystone' 'python2-keystone')
pkgver=2014.1.1
pkgrel=2
pkgdesc="OpenStack Identity"
arch=(any)
url="https://launchpad.net/keystone"
license=('Apache')
depends=('python2' 'python2-setuptools')
makedepends=('python2-setuptools' 'python2-sphinx' 'python2-oslo-sphinx')
options=('emptydirs')
source=("$url/icehouse/2014.1.1/+download/$pkgbase-$pkgver.tar.gz"
        "keystone.service")
md5sums=('e99ecd6e0e24fedb69c42108960b3ea4'
         'c3ddbede14b4c937c3da77c81b817345')

build() {
  cd "$pkgbase-$pkgver"
  /usr/bin/python2 setup.py build
  #/usr/bin/python2 -d setup.py build_sphinx
  /usr/bin/python2 setup.py install --root="$srcdir/tmp" \
                                    --install-data="/" \
                                    --optimize=1
  cp -R etc/ "$srcdir/tmp/"
  #cp -R doc/build/man/ "$srcdir/tmp/"
}

package_keystone() {
  pkgdesc+=" - Daemon"
  depends=('python2-keystone')
  backup=('etc/keystone/keystone.conf')
  install=keystone.install

  cd tmp

  install -d "${pkgdir}/etc/keystone/"
  install -m 640 etc/default_catalog.templates "${pkgdir}/etc/keystone/default_catalog.templates"
  install -m 640 etc/keystone.conf.sample "${pkgdir}/etc/keystone/keystone.conf"
  install -m 640 etc/keystone-paste.ini "${pkgdir}/etc/keystone/"
  install -m 640 etc/logging.conf.sample "${pkgdir}/etc/keystone/logging.conf"
  install -m 640 etc/policy.json "${pkgdir}/etc/keystone/"
  install -m 640 etc/policy.v3cloudsample.json "${pkgdir}/etc/keystone/"
  
  install -d "${pkgdir}/usr/bin/"
  install -m 755 usr/bin/keystone-all "${pkgdir}/usr/bin/"
  install -m 755 usr/bin/keystone-manage "${pkgdir}/usr/bin/"

  #install -d "${pkgdir}/usr/share/man/man1/"
  #install -m 644 man/keystone-all.1 "${pkgdir}/usr/share/man/man1/"
  #install -m 644 man/keystone-manage.1 "${pkgdir}/usr/share/man/man1/"

  install -D -m 644 ${srcdir}/keystone.service "${pkgdir}/usr/lib/systemd/system/keystone.service"

  install -d -m 0770 "${pkgdir}/var/lib/keystone/"
  install -d -m 0770 "${pkgdir}/var/log/keystone/"
}


package_python2-keystone() {
  pkgdesc+=" - Python library"
  depends=('python2-pip' 'libxslt')
  optdepends=('python2-pymongo>=2.4: optional backend'
              'python2-pysqlite: optional backend'
              'python2-memcached>=1.48: optional backend'
              'python2-ldap=2.3.13: optional backend')
  install=python2-keystone.install

  cd tmp

  install -d "${pkgdir}/usr/lib/"
  cp -R usr/lib/ "${pkgdir}/usr/"
}

# vim:set ts=2 sw=2 et:
