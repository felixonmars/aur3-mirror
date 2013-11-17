# Maintainer: Antoni Segura Puimedon <antonisp@celebdor.com>
pkgname=vdsm
pkgver=4.13
pkgrel=2
pkgdesc="oVirt's Virtual Desktop and Server Manager."
arch=('i686' 'x86_64')
url="http://www.ovirt.org/Vdsm"
license=('APACHE')
groups=()
depends=(
    'bridge-utils'
    'cdrkit'  # genisoimage
    'chrony'
    'dhclient'  # For multiple gateways (arch usually ships with dhcpd)
    'dosfstools'  # mkfs.vfat, mkfs.msdos
    'e2fsprogs'  # mkfs.ext2
    'ed'
    'fence-agents'
    'glusterfs'
    'gnutls'  # certtool
    'inetutils'  # hostname
    'iproute2'
    'libguestfs'
    'libselinux'
    'libvirt>=1.0.2'
    'multipath-tools-git'  # TODO: Make a stable version
    'open-iscsi'
    'openssl'
    'psmisc'
    'pyparted'
    'python2-cpopen'
    'python2-dmidecode-git'  # TODO: Make a stable version
    'python2-ethtool'
    'python2-m2crypto'
    'python2-netaddr'
    'python2-pthreading'
    'python2-pyinotify'
    'python2-rtslib-fb'
    'rpcbind'
    'sanlock'
    'sosreport'  # Not packaged yet in Arch https://github.com/sosreport/sosreport
    'tree'
)
makedepends=('python2-pyflakes' 'pep8-python2' 'python2-nose')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("$pkgname::git+https://git.fedorahosted.org/git/python-ethtool.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  sed -i -e 's/iscsid.service/open-iscsi.service/' init/systemd/vdsmd.service
  PYTHON="$(which python2)" ./autogen.sh --system
  make
}

package() {
  cd "$srcdir/$pkgname"
  make
  make DESTDIR="$pkgdir" install
}
