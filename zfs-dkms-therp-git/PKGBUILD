# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
# Contributor: Kyle Fuller <inbox at kylefuller dot co dot uk>

pkgname="zfs-dkms-therp-git"
pkgver=0.6.2_r162.g3566d5c
_pkgver=${pkgver/_*/}
pkgrel=1
pkgdesc="Kernel modules for the Zettabyte File System."
depends=("spl-dkms-therp-git" "zfs-utils-therp-git" "dkms")
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=(git://github.com/zfsonlinux/zfs.git)
groups=("archzfs")
license=("CDDL")
install=zfs-dkms-therp.install
conflicts=("zfs-dkms-therp")

pkgver() {
  cd "$srcdir/zfs"
  git describe --long | sed -E 's/-([^-]*-g)/_r\1/;s/-/./g;s/zfs\.//'
}

build() {
  cd "$srcdir/zfs"
  ./autogen.sh
  scripts/dkms.mkconf -v ${_pkgver} -f dkms.conf -n zfs
}

package() {
   depends=("spl-dkms-therp-git" "zfs-utils-therp-git=${pkgver}" "dkms")
   install -d ${pkgdir}/usr/src/zfs-${_pkgver}
   cp -a -T ${srcdir}/zfs ${pkgdir}/usr/src/zfs-${_pkgver}
}
md5sums=('SKIP')
