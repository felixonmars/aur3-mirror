# Maintainer: Lance Chen <cyen0312+aur@gmail.com>

pkgbase=heat
pkgname=('heat-api'
         'heat-api-cfn'
         'heat-api-cloudwatch'
         'heat-common'
         'heat-engine'
         'heat-plugin-docker'
         'python2-heat')
pkgver=2014.1.1
pkgrel=2
pkgdesc="OpenStack orchestration service"
arch=(any)
url="https://launchpad.net/heat"
license=('Apache')
makedepends=('python2-setuptools'
             'python2-sphinx'
             'python2-oslosphinx')
options=('emptydirs')
install=heat.install
source=("$url/icehouse/2014.1.1/+download/$pkgbase-$pkgver.tar.gz"
        "heat-api-cfn.service"
        "heat-api-cloudwatch.service"
        "heat-api.service"
        "heat-engine.service")
md5sums=('96aaae0105cef816f4d106a1952a196a'
         'a7747fecc6f41b83d99546621a06c908'
         'c6f4029de260543c368ac350197ff5c5'
         '6c6a28babfbd260970b76622b489f762'
         'e857128655cb34fb53af278f74e45010')

build() {
  cd "$pkgbase-$pkgver"
  /usr/bin/python2 setup.py build
  #/usr/bin/python2 -d setup.py build_sphinx
  /usr/bin/python2 setup.py install --root="$srcdir/tmp" \
                                    --install-data="/" \
                                    --optimize=1
  cp -R etc/ "$srcdir/tmp/"
}

package_heat-api() {
  pkgdesc+=" - ReST API"
  depends=('heat-common')

  cd tmp

  install -D -m 755 usr/bin/heat-api "$pkgdir/usr/bin/heat-api"
  install -D -m 644 "$srcdir/heat-api.service" \
                 "$pkgdir/usr/lib/systemd/system/heat-api.service"
}

package_heat-api-cfn() {
  pkgdesc+=" - CFN API"
  depends=('heat-common')

  cd tmp

  install -D -m 755 usr/bin/heat-api-cfn "$pkgdir/usr/bin/heat-api-cfn"
  install -D -m 644 "$srcdir/heat-api-cfn.service" \
                 "$pkgdir/usr/lib/systemd/system/heat-api-cfn.service"
}

package_heat-api-cloudwatch() {
  pkgdesc+=" - CloudWatch API"
  depends=('heat-common')

  cd tmp

  install -D -m 755 usr/bin/heat-api-cloudwatch "$pkgdir/usr/bin/heat-api-cloudwatch"
  install -D -m 644 "$srcdir/heat-api-cloudwatch.service" \
                 "$pkgdir/usr/lib/systemd/system/heat-api-cloudwatch.service"
}

package_heat-common() {
  pkgdesc+=" - common files"
  install=heat-common.install
  depends=('python2-heat')
  backup=('etc/heat/api-paste.ini'
          'etc/heat/heat.conf')

  cd tmp

  install -d "$pkgdir/etc/heat/"
  install -m 640 etc/heat/api-paste.ini "$pkgdir/etc/heat/api-paste.ini"
  install -m 640 etc/heat/heat.conf.sample "$pkgdir/etc/heat/heat.conf"
  install -m 640 etc/heat/policy.json "$pkgdir/etc/heat/policy.json"

  install -d "$pkgdir/usr/bin/"
  install -m 755 usr/bin/heat-keystone-setup "$pkgdir/usr/bin/"
  install -m 755 usr/bin/heat-manage "$pkgdir/usr/bin/"

  install -d -m 0755 "$pkgdir/var/lib/heat/"
  install -d -m 0755 "$pkgdir/var/log/heat/"
}

package_heat-engine() {
  pkgdesc+=" - engine"
  depends=('heat-common')

  cd tmp

  install -D -m 644 etc/heat/environment.d/default.yaml "$pkgdir/etc/heat/environment.d/default.yaml"
  install -D -m 755 usr/bin/heat-engine "$pkgdir/usr/bin/heat-engine"
  install -D -m 644 "$srcdir/heat-engine.service" \
                 "$pkgdir/usr/lib/systemd/system/heat-engine.service"
}

package_heat-plugin-docker() {
  pkgdesc+=" - Docker plugin"
  depends=('heat-common' 'python2-docker')

  cd "$pkgbase-$pkgver"

  install -d "$pkgdir/usr/lib/heat/"
  cp -R contrib/docker/docker/resources "$pkgdir/usr/lib/heat/docker"
}

package_python2-heat() {
  pkgdesc+=" - Python library"
  install=python2-heat.install
  depends=('python2-pip')

  cd tmp

  install -d "$pkgdir/usr/lib/"
  cp -R usr/lib/ "$pkgdir/usr/"
}

# vim:set sw=2 sts=2 et:
