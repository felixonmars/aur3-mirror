pkgname=cloud-init
pkgver=0.7.4
pkgrel=1
pkgdesc="Bootstrap EC2 instances with Cloud-init from Canonical.  Packaged from tarball release."
arch=(any)
license=("GPLv3")
url=https://launchpad.net/cloud-init
# cloud-init python lib requirements (according to Requires file):
depends=(systemd python2 python2-yaml python2-cheetah python2-prettytable python2-oauth2 python2-boto python2-configobj python2-jsonpatch python2-jsonpointer)
makedepends=('bzr' 'python2' 'python2-setuptools')
# Archlinux specific cloud.cfg
source=(archlinux.cloud.cfg
  https://launchpad.net/cloud-init/trunk/0.7.4/+download/cloud-init-0.7.4.tar.gz
        )
noextract=(archlinux.cloud.cfg)
sha1sums=(4e32767ac0e18f3b6f34cfb184af17c8a84d563c
    422d26b3860803ca3ae45e463a5c172b956f655a
)
backup=(etc/cloud/cloud.cfg etc/cloud/cloud.cfg.d/05_logging.cfg)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 ./setup.py install --root=${pkgdir} --init-system systemd
}

package() {
  # Use a cloud.cfg crafted for archlinux
  mv $pkgdir/etc/cloud/cloud.cfg ${pkgdir}/etc/cloud/cloud.cfg.ubuntu_default
  cp archlinux.cloud.cfg ${pkgdir}/etc/cloud/cloud.cfg
}
