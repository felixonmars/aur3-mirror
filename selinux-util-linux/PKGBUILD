# $Id: PKGBUILD 187046 2013-06-03 11:15:40Z allan $
# Maintainer: Tom Gundersen <teg@jklm.no>
# Maintainer: Nicky726 <nicky726@gmail.com>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=selinux-util-linux
_origname=util-linux
pkgver=2.23.1
pkgrel=2
pkgdesc="SELinux aware miscellaneous system utilities for Linux"
url="http://www.kernel.org/pub/linux/utils/util-linux/"
arch=('i686' 'x86_64')
groups=('selinux' 'selinux-system-utilities')
depends=('selinux-pam' 'selinux-shadow' 'selinux-coreutils' 'glibc' 'selinux-usr-libselinux')
makedepends=('systemd')
# checkdepends=('bc')
conflicts=('util-linux-ng' "${_origname}" 'eject')
provides=("util-linux-ng=${pkgver}" "${_origname}=${pkgver}-${pkgrel}" 'eject')
license=('GPL2')
options=('!libtool')
source=(ftp://ftp.kernel.org/pub/linux/utils/${_origname}/v2.23/${_origname}-${pkgver}.tar.xz
        uuidd.tmpfiles
        pam-login
        pam-common
        pam-su)
backup=(etc/pam.d/chfn
        etc/pam.d/chsh
        etc/pam.d/login
        etc/pam.d/su
        etc/pam.d/su-l)
install=util-linux.install
md5sums=('33ba55ce82f8e3b8d7a38fac0f62779a'
         'a39554bfd65cccfd8254bb46922f4a67'
         '4368b3f98abd8a32662e094c54e7f9b1'
         'a31374fef2cba0ca34dfc7078e2969e4'
         'fa85e5cce5d723275b14365ba71a8aad')

build() {
  cd "${srcdir}/${_origname}-${pkgver}"

  ./configure --prefix=/usr \
              --libdir=/usr/lib \
              --localstatedir=/run \
              --enable-fs-paths-extra=/usr/bin \
              --enable-raw \
              --enable-vipw \
              --enable-newgrp \
              --enable-chfn-chsh \
              --enable-write \
              --enable-mesg \
              --enable-socket-activation \
              --with-selinux

#              --enable-reset \ # part of ncurses
#              --enable-line \ # not part of any package
#              --enable-last \ # not compat

  make
}

#check() {
# fails for some reason in chroot, works outside
#  make -C "$_origname-$pkgver" check
#}

package() {
  cd "${srcdir}/${_origname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # setuid chfn and chsh
  chmod 4755 "$pkgdir"/usr/bin/{newgrp,ch{sh,fn}}

  # install PAM files for login-utils
  install -Dm644 "$srcdir/pam-common" "$pkgdir/etc/pam.d/chfn"
  install -m644 "$srcdir/pam-common" "$pkgdir/etc/pam.d/chsh"
  install -m644 "$srcdir/pam-login" "$pkgdir/etc/pam.d/login"
  install -m644 "$srcdir/pam-su" "${pkgdir}/etc/pam.d/su"
  install -m644 "$srcdir/pam-su" "${pkgdir}/etc/pam.d/su-l"

  # include tmpfiles fragment for uuidd
  # TODO(dreisner): offer this upstream?
  install -Dm644 "$srcdir/uuidd.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/uuidd.conf"

  # usrmove
  cd "$pkgdir"
  mv {,usr/}sbin/* usr/bin
  mv bin/* usr/bin
  rmdir bin sbin usr/sbin
}
