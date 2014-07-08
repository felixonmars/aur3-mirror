# Maintainer: Lance Chen <cyen0312+aur@gmail.com>

pkgbase=ceilometer
pkgname=('ceilometer-agent-central'
         'ceilometer-agent-compute'
         'ceilometer-agent-notification'
         'ceilometer-alarm-evaluator'
         'ceilometer-alarm-notifier'
         'ceilometer-api'
         'ceilometer-collector'
         'ceilometer-common'
         'python2-ceilometer')
pkgver=2014.1.1
pkgrel=1
pkgdesc="OpenStack Telemetry service"
arch=(any)
url="https://launchpad.net/ceilometer"
license=('Apache')
makedepends=('python2-setuptools'
             'python2-sphinx'
             'python2-oslo-sphinx')
options=('emptydirs')
install=ceilometer.install
source=("$url/icehouse/2014.1.1/+download/$pkgbase-$pkgver.tar.gz"
        "ceilometer-agent-central.service"
        "ceilometer-agent-compute.service"
        "ceilometer-agent-notification.service"
        "ceilometer-alarm-evaluator.service"
        "ceilometer-alarm-notifier.service"
        "ceilometer-api.service"
        "ceilometer-collector.service")

md5sums=('6311c8054f781fd2c23bc737c6ef8898'
         '9a9988c18abee9aaf726f29d95506bb0'
         '428f5828ca2caaacf81838f2391f923f'
         '148c9f5b3c0fb74258d56c7be24ac832'
         'b5c674dcf41384057c5ceabb8529d034'
         'd282948ac6fff73fb85faa0ce78e0f5c'
         '8abcd897570b2b7bcef3319f926b0047'
         'f8eab0a46bddfded7e6f66c3499e5497')

build() {
  cd "$pkgbase-$pkgver"
  /usr/bin/python2 setup.py build
  #/usr/bin/python2 -d setup.py build_sphinx
  /usr/bin/python2 setup.py install --root="$srcdir/tmp" \
                                    --install-data="/" \
                                    --optimize=1
  cp -R etc/ "$srcdir/tmp/"
}

package_ceilometer-agent-central() {
  pkgdesc+=" - Central agent"
  depends=('ceilometer-common')

  cd tmp

  install -D -m 755 usr/bin/ceilometer-agent-central \
                    "$pkgdir/usr/bin/ceilometer-agent-central"
  install -D -m 644 "$srcdir/ceilometer-agent-central.service" \
                    "$pkgdir/usr/lib/systemd/system/ceilometer-agent-central.service"
}

package_ceilometer-agent-compute() {
  pkgdesc+=" - Compute agent"
  depends=('ceilometer-common')

  cd tmp

  install -D -m 755 usr/bin/ceilometer-agent-compute \
                    "$pkgdir/usr/bin/ceilometer-agent-compute"
  install -D -m 644 "$srcdir/ceilometer-agent-compute.service" \
                    "$pkgdir/usr/lib/systemd/system/ceilometer-agent-compute.service"
}

package_ceilometer-agent-notification() {
  pkgdesc+=" - Notification agent"
  depends=('ceilometer-common')

  cd tmp

  install -D -m 755 usr/bin/ceilometer-agent-notification \
                    "$pkgdir/usr/bin/ceilometer-agent-notification"
  install -D -m 644 "$srcdir/ceilometer-agent-notification.service" \
                    "$pkgdir/usr/lib/systemd/system/ceilometer-agent-notification.service"
}

package_ceilometer-alarm-evaluator() {
  pkgdesc+=" - Alarm evaluator"
  depends=('ceilometer-common')

  cd tmp

  install -D -m 755 usr/bin/ceilometer-alarm-evaluator \
                    "$pkgdir/usr/bin/ceilometer-alarm-evaluator"
  install -D -m 644 "$srcdir/ceilometer-alarm-evaluator.service" \
                    "$pkgdir/usr/lib/systemd/system/ceilometer-alarm-evaluator.service"
}

package_ceilometer-alarm-notifier() {
  pkgdesc+=" - Alarm notifier"
  depends=('ceilometer-common')

  cd tmp

  install -D -m 755 usr/bin/ceilometer-alarm-notifier \
                    "$pkgdir/usr/bin/ceilometer-alarm-notifier"
  install -D -m 644 "$srcdir/ceilometer-alarm-notifier.service" \
                    "$pkgdir/usr/lib/systemd/system/ceilometer-alarm-notifier.service"
}

package_ceilometer-api() {
  pkgdesc+=" - API service"
  depends=('ceilometer-common')
  optdepends=('mongodb')

  cd tmp

  install -D -m 755 usr/bin/ceilometer-api "$pkgdir/usr/bin/ceilometer-api"
  install -D -m 644 "$srcdir/ceilometer-api.service" \
                    "$pkgdir/usr/lib/systemd/system/ceilometer-api.service"
}

package_ceilometer-collector() {
  pkgdesc+=" - Colletor service"
  depends=('ceilometer-common')
  optdepends=('mongodb')

  cd tmp

  install -D -m 755 usr/bin/ceilometer-collector "$pkgdir/usr/bin/ceilometer-collector"
  install -D -m 644 "$srcdir/ceilometer-collector.service" \
                    "$pkgdir/usr/lib/systemd/system/ceilometer-collector.service"
}

package_ceilometer-common() {
  pkgdesc+=" - common files"
  install=ceilometer-common.install
  depends=('python2-ceilometer')
  backup=('etc/ceilometer/ceilometer.conf')

  cd tmp

  install -d "$pkgdir/etc/ceilometer/"
  install -m 640 etc/ceilometer/ceilometer.conf.sample "$pkgdir/etc/ceilometer/ceilometer.conf"
  install -m 640 etc/ceilometer/deprecated_pipeline.yaml "$pkgdir/etc/ceilometer/"
  install -m 640 etc/ceilometer/event_definitions.yaml "$pkgdir/etc/ceilometer/"
  install -m 644 etc/ceilometer/pipeline.yaml "$pkgdir/etc/ceilometer/"
  install -m 644 etc/ceilometer/policy.json "$pkgdir/etc/ceilometer/"
  install -m 644 etc/ceilometer/sources.json "$pkgdir/etc/ceilometer/"

  install -d "$pkgdir/usr/bin/"
  install -m 755 usr/bin/ceilometer-dbsync "$pkgdir/usr/bin/"
  install -m 755 usr/bin/ceilometer-expirer "$pkgdir/usr/bin/"
  install -m 755 usr/bin/ceilometer-send-sample "$pkgdir/usr/bin/"

  install -d -m 0755 "$pkgdir/var/lib/ceilometer/"
  install -d -m 0755 "$pkgdir/var/log/ceilometer/"
}

package_python2-ceilometer() {
  pkgdesc+=" - Python library"
  install=python2-ceilometer.install
  depends=('python2-pip')

  cd tmp

  install -d "$pkgdir/usr/lib/"
  cp -R usr/lib/ "$pkgdir/usr/"
}

# vim:set sw=2 sts=2 et:
