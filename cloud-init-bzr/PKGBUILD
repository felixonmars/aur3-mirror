pkgname=cloud-init-bzr
pkgver=740
pkgrel=2
pkgdesc="Bootstrap EC2 instances with Cloud-init from Canonical.  Packaged from bzr trunk."
arch=(any)
license=("GPLv3")
url=https://launchpad.net/cloud-init
# cloud-init python lib requirements (according to Requires file):
# cheetah (aur), PrettyTable (aur), oauth (aur), boto (aur), configobj (community), pyyaml (community), argparse (aur)
# the ONLY non-match is we are using python2-yaml vs pyyaml.
depends=(systemd python2 python2-yaml python2-cheetah python2-prettytable python2-oauth2 python2-boto python2-argparse python2-configobj)
makedepends=('bzr' 'python2' 'python2-distribute')
_bzrtrunk="lp:cloud-init"
_bzrmod="cloud-init"
# Archlinux specific cloud.cfg
source=(archlinux.cloud.cfg)
noextract=(archlinux.cloud.cfg)
sha1sums=(4e32767ac0e18f3b6f34cfb184af17c8a84d563c)
backup=(etc/cloud/cloud.cfg etc/cloud/cloud.cfg.d/05_logging.cfg)

build() {
  cd $srcdir

  msg "Connecting to Bazaar server..."
  if [ -d $_bzrmod ]; then
    cd ${_bzrmod} && bzr pull ${_bzrtrunk} -r ${pkgver}
    msg "The local files are updated."
  else
    bzr branch ${_bzrtrunk} ${_bzrmod} -q -r ${pkgver}
    cd $_bzrmod
  fi
  msg "Bazaar checkout done or server timeout"

  python2 ./setup.py install --root=${pkgdir} --init-system systemd
}

package() {
  # Use a cloud.cfg crafted for archlinux
  mv $pkgdir/etc/cloud/cloud.cfg ${pkgdir}/etc/cloud/cloud.cfg.ubuntu_default
  cp archlinux.cloud.cfg ${pkgdir}/etc/cloud/cloud.cfg
}
