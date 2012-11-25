pkgname=cloud-init
pkgver=0.7.1
pkgrel=2
pkgdesc="Bootstrap EC2 instances with Cloud-init from Canonical.  Packaged from tarball release."
arch=(any)
license=("GPLv3")
url=https://launchpad.net/cloud-init
# cloud-init python lib requirements (according to Requires file):
# cheetah (aur), PrettyTable (aur), oauth (aur), boto (aur), configobj (community), pyyaml (community), argparse (aur)
# the ONLY non-match is we are using python2-yaml vs pyyaml.
depends=(systemd python2 python2-yaml python2-cheetah python2-prettytable python2-oauth2 python2-boto python2-argparse python2-configobj)
makedepends=('python2' 'python2-distribute')
# Archlinux specific cloud.cfg
source=(archlinux.cloud.cfg
        https://launchpad.net/cloud-init/trunk/0.7.1/+download/cloud-init-0.7.1.tar.gz
        )
noextract=(archlinux.cloud.cfg)
sha1sums=(4e32767ac0e18f3b6f34cfb184af17c8a84d563c
          b2948983d8f353d490d2658829738248a7923067 
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
