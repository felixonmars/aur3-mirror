# Maintainer: Lance Chen <cyen0312+aur@gmail.com>

pkgbase=cinder
pkgname=('cinder-api'
         'cinder-backup'
         'cinder-common'
         'cinder-scheduler'
         'cinder-volume'
         'python2-cinder')
pkgver=2014.1.1
pkgrel=1
pkgdesc="OpenStack Block storage service"
arch=(any)
url="https://launchpad.net/cinder"
license=('Apache')
depends=('python2' 'python2-setuptools')
makedepends=('python2-setuptools')
options=('emptydirs')
install=cinder.install
source=("$url/icehouse/2014.1.1/+download/$pkgbase-$pkgver.tar.gz"
        "cinder-api.service"
        "cinder-backup.service"
        "cinder-scheduler.service"
        "cinder-volume.service"
        "cinder_sudoers"
        "cinder.tmpfiles"
        "cinder_tgt.conf")
md5sums=('385f6e60f4ab468dcdf8154eb2b42613'
         'e96366e192c2ac681070355df4e61bc8'
         '1765718f6d50190d1ff6564de3545f0f'
         '32264d52fadfdd27c3861d421a242278'
         'd9b6b64afb5ae7db9c817246d04198c7'
         '081d18c05b770876e42a7d2c5d7c6369'
         '293a25b8f1ba4ac8b1627c279acd7208'
         '4bb63cd3ac292bf0f04fb0e2db1a2866')

build() {
  cd "$pkgbase-$pkgver"
  /usr/bin/python2 setup.py build
  /usr/bin/python2 setup.py install --root="$srcdir/tmp" \
                                    --install-data="/" \
                                    --optimize=1
  cp -R etc/ "$srcdir/tmp/"
}

package_cinder-api() {
  pkgdesc+=" - API service"
  depends=('cinder-common')

  cd tmp

  install -D -m 755 usr/bin/cinder-api "$pkgdir/usr/bin/cinder-api"
  install -D -m 644 $srcdir/cinder-api.service \
                    "$pkgdir/usr/lib/systemd/system/cinder-api.service"
}

package_cinder-backup() {
  pkgdesc+=" - Backup service"
  depends=('cinder-common')

  cd tmp

  install -D -m 755 usr/bin/cinder-backup "$pkgdir/usr/bin/cinder-backup"
  install -D -m 644 $srcdir/cinder-backup.service \
                    "$pkgdir/usr/lib/systemd/system/cinder-backup.service"
}

package_cinder-common() {
  pkgdesc+=" - common files"
  install=cinder-common.install
  backup=('etc/cinder/cinder.conf')
  depends=('python2-cinder')

  cd tmp

  install -d "$pkgdir/etc/cinder/"
  install -m 640 etc/cinder/api-paste.ini "$pkgdir/etc/cinder/"
  install -m 640 etc/cinder/cinder.conf.sample "$pkgdir/etc/cinder/cinder.conf"
  install -m 640 etc/cinder/logging_sample.conf "$pkgdir/etc/cinder/logging.conf"
  install -m 644 etc/cinder/policy.json "$pkgdir/etc/cinder/"
  install -m 644 etc/cinder/rootwrap.conf "$pkgdir/etc/cinder/"

  install -D -m 440 "$srcdir/cinder_sudoers" "$pkgdir/etc/sudoers.d/cinder_sudoers"

  install -d "$pkgdir/usr/bin/"
  install -m 755 usr/bin/cinder-manage "$pkgdir/usr/bin/"
  install -m 755 usr/bin/cinder-rootwrap "$pkgdir/usr/bin/"
  install -m 755 usr/bin/cinder-rpc-zmq-receiver "$pkgdir/usr/bin/"
  install -m 755 usr/bin/cinder-rtstool "$pkgdir/usr/bin/"

  install -D -m 644 "$srcdir/cinder.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/cinder.conf"

  install -d -m 0770 "$pkgdir/run/lock/cinder/"
  install -d -m 0755 "$pkgdir/var/lib/cinder/"
  install -d -m 0755 "$pkgdir/var/log/cinder/"
}

package_cinder-scheduler() {
  pkgdesc+=" - Scheduler service"
  depends=('cinder-common')

  cd tmp

  install -D -m 755 usr/bin/cinder-scheduler "$pkgdir/usr/bin/cinder-scheduler"
  install -D -m 644 $srcdir/cinder-scheduler.service \
                    "$pkgdir/usr/lib/systemd/system/cinder-scheduler.service"
}

package_cinder-volume() {
  pkgdesc+=" - Volume service"
  depends=('cinder-common' 'lvm2' 'tgt')

  cd tmp

  install -D -m 644 etc/cinder/rootwrap.d/volume.filters "$pkgdir/etc/cinder/rootwrap.d/volume.filters"
  install -D -m 644 "$srcdir/cinder_tgt.conf" "$pkgdir/etc/tgt/conf.d/cinder_tgt.conf"

  install -d "$pkgdir/usr/bin/"
  install -m 755 usr/bin/cinder-clear-rabbit-queues "$pkgdir/usr/bin/"
  install -m 755 usr/bin/cinder-volume "$pkgdir/usr/bin/"
  install -m 755 usr/bin/cinder-volume-usage-audit "$pkgdir/usr/bin/"

  install -D -m 644 $srcdir/cinder-volume.service \
                    "$pkgdir/usr/lib/systemd/system/cinder-volume.service"
}

package_python2-cinder() {
  pkgdesc+=" - Python Library"
  install=python2-cinder.install
  depends=('python2-pip')

  cd tmp

  install -d "$pkgdir/usr/lib/"
  cp -R usr/lib/ "$pkgdir/usr/"
}

# vim:set ts=2 sw=2 et:
