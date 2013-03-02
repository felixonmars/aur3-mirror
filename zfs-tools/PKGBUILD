# Maintainer: Boudhayan Gupta <me@BaloneyGeek.com>

_pkgname=zfs
pkgname=${_pkgname}-tools
_pkgmaj=0.6.0
_pkgmin=rc14
pkgver=${_pkgmaj}_${_pkgmin}
_pkgver=${_pkgmaj}-${_pkgmin}
pkgrel=1
pkgdesc="ZFS usermode tools"

url="http://zfsonlinux.org"
arch=("x86_64" "i686")
license=("CDDL")
depends=("spl-modules-dkms" "zfs-modules-dkms" "spl-tools")
optdepends=()
makedepends=()
conflicts=()
provides=()
backup=()

source=("http://archive.zfsonlinux.org/downloads/zfsonlinux/zfs/zfs-0.6.0-rc14.tar.gz"
        "zfs-utils.bash-completion"
        "zfs-utils.initcpio.install"
        "zfs-utils.initcpio.hook"
        "zfs-utils.service")
md5sums=("adf09eb2144ef49734be12565d9ea4fe"
         "3e1c4a29c4f7d590e6a3041f2c61d6ff"
         "d654e88a606fe68f93a8fa26bca4655d"
         "105fe46115c6fc6a335399c74bd58289"
         "161e6a5f5f314c9308b4a4565c01fe45")

build() {
  cd ${srcdir}/${_pkgname}-${_pkgver}
  ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --sbindir=/usr/sbin \
              --libdir=/usr/lib \
              --datadir=/usr/share \
              --includedir=/usr/include \
              --with-udevdir=/lib/udev \
              --libexecdir=/usr/lib/${_pkgname}-${_pkgver} \
              --with-config=user
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${_pkgver}
  make DESTDIR=${pkgdir} install

  # move module tree /lib -> /usr/lib
  cp -r ${pkgdir}/{lib,usr}
  rm -r ${pkgdir}/lib

  # Remove uneeded directories
  rm -r ${pkgdir}/usr/share/dracut
  rm -r ${pkgdir}/etc/rc.d

  install -D -m644 ${srcdir}/zfs-utils.initcpio.hook ${pkgdir}/usr/lib/initcpio/hooks/zfs
  install -D -m644 ${srcdir}/zfs-utils.initcpio.install ${pkgdir}/usr/lib/initcpio/install/zfs
  install -D -m644 ${srcdir}/zfs-utils.service ${pkgdir}/usr/lib/systemd/system/zfs.service
  install -D -m644 ${srcdir}/zfs-utils.bash-completion ${pkgdir}/usr/share/bash-completion/completions/zfs
}
