# Contributor: C Anthony Risinger
pkgname=vps-lxc-git
pkgver=20110620
pkgrel=2
pkgdesc="Solution for managing LXC based VPS templates and domains"
url=http://devel.xtfx.me/pub/vps-lxc
arch=(any)
license=(BSD)
depends=(lxc)
#makedepends=(git)
optdepends=("dnsmasq: create a virtual LAN on the host for use by containers"
            "iptables: create a virtual LAN on the host for use by containers"
            "bridge-utils: configure bridges and virtual LAN on the host for use by containers"
            "btrfs-progs: create VPS templates/domains within BTRFS subvolumes and snapshots"
            "debootstrap: generate Debian/Ubuntu templates and containers")
source=()
md5sums=()

_gitroot="git://github.com/xofme/vps-lxc.git"
_gitname="master"

build() {

  msg2 "Syncing with ${_gitroot}..."
    g=${startdir}/${pkgname}.git; w=${pkgdir}
    if [ -d "${g}" ]; then
      git --git-dir=${g} fetch -u -n || return 1
      git --git-dir=${g} update-ref HEAD FETCH_HEAD
      git --git-dir=${g} read-tree --reset -u HEAD || return 1
    else
      rmdir ${w}
      git --work-tree=${w} clone ${_gitroot} ${g} || return 1
    fi
  msg2 "Fetched remote ${_gitname}"

  # build the dir structure
  ${pkgdir}/struct

  # edit files (this will not be needed soon, will fix)
  sed -i -e "s,^\(VPS_BASE=\).*,\\1,g" ${pkgdir}/etc/vps-lxc/vps-lxc.conf

  # remove erroneous
  rm -f ${pkgdir}/{.gitignore,struct,README}
 
}

# vim:set ts=2 sw=2 et:
