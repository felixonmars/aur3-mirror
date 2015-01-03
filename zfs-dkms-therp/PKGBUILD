# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
# Contributor: Kyle Fuller <inbox at kylefuller dot co dot uk>

pkgname=("zfs-dkms-therp")
pkgver=0.6.3_1.2
github_pkg=zfs-${pkgver/_/-}
pkgrel=1
pkgdesc="Kernel modules for the Zettabyte File System."
depends=("spl-dkms-therp=${pkgver}-${pkgrel}" "zfs-utils-therp=${pkgver}-${pkgrel}" "dkms")
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=(https://github.com/zfsonlinux/zfs/archive/${github_pkg}.tar.gz)
groups=("archzfs")
md5sums=('0b183b0abdd5be287046ad9ce4f899fd')
license=("CDDL")
install=zfs-dkms-therp.install

build() {
  cd "$srcdir/zfs-${github_pkg}"
  ./autogen.sh
  scripts/dkms.mkconf -v ${pkgver} -f dkms.conf -n zfs
}


package_zfs-dkms-therp() {
   install -d ${pkgdir}/usr/src
   cp -a ${srcdir}/zfs-${github_pkg}/ ${pkgdir}/usr/src/zfs-${pkgver}
}

md5sums=('67d6b60cdac7857e5475778ebc19e167')
