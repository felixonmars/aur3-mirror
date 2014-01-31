pkgname=cloud-init-bzr
pkgver=740
pkgrel=3
pkgdesc="Bootstrap EC2 instances with Cloud-init from Canonical.  Packaged from bzr trunk."
arch=(any)
license=("GPLv3")
url=https://launchpad.net/cloud-init
# cloud-init python lib requirements (according to Requires file):
depends=(systemd python2 python2-yaml python2-cheetah python2-prettytable python2-oauth2 python2-boto python2-configobj python2-jsonpatch python2-jsonpointer)
makedepends=('bzr' 'python2' 'python2-setuptools')
# Archlinux specific cloud.cfg
source=(bzr+lp:cloud-init archlinux.cloud.cfg)
noextract=(archlinux.cloud.cfg)
sha1sums=(SKIP 4e32767ac0e18f3b6f34cfb184af17c8a84d563c)
backup=(etc/cloud/cloud.cfg etc/cloud/cloud.cfg.d/05_logging.cfg)

build() {
  cd $srcdir/cloud-init
  # change the shebang line for cloud-init build tools to python2
  sed -i.orig 's%/usr/bin/env python%/usr/bin/env python2%' tools/*
  python2 ./setup.py install --root=${pkgdir} --init-system systemd
}

package() {
  # Use a cloud.cfg crafted for archlinux
  mv $pkgdir/etc/cloud/cloud.cfg ${pkgdir}/etc/cloud/cloud.cfg.ubuntu_default
  cp archlinux.cloud.cfg ${pkgdir}/etc/cloud/cloud.cfg
}
