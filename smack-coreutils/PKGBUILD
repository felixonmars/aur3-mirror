# $Id: PKGBUILD 155401 2012-04-03 11:10:00Z allan $
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=smack-coreutils
_pkgname=coreutils
pkgver=8.16
pkgrel=2
pkgdesc="The basic file, shell and text manipulation utilities of the GNU operating system"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.gnu.org/software/coreutils"
groups=('base')
depends=('glibc' 'pam' 'acl' 'gmp' 'libcap')
replaces=('mktemp')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/pam.d/su')
install=${_pkgname}.install
options=('!emptydirs')
source=(ftp://ftp.gnu.org/gnu/$_pkgname/$_pkgname-$pkgver.tar.xz{,.sig}
	coreutils-uname.patch
	coreutils-pam.patch
	coreutils-smack.patch
	su.pam)
md5sums=('89b06f91634208dceba7b36ad1f9e8b9'
         '63158176d5bb005c6871242c940eedf1'
         'c4fcca138b6abf6d443d48a6f0cd8833'
         'aad79a2aa6d566c375d7bdd1b0767278'
         'aa9282120b9cbf692d0d2a7f729f3a1b'
         'fa85e5cce5d723275b14365ba71a8aad')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  # added su wheel group pam patch (from fedora git)
  patch -Np1 -i ${srcdir}/coreutils-pam.patch

  # linux specific uname improvement (from gentoo portage)
  patch -Np1 -i ${srcdir}/coreutils-uname.patch

  # smack specific -M option for ls
  patch -Np1 -i ${srcdir}/coreutils-smack.patch

  autoreconf -v
  ./configure --prefix=/usr --libexecdir=/usr/lib/coreutils \
              --enable-install-program=su \
              --enable-no-install-program=groups,hostname,kill,uptime \
              --enable-pam
  make
}

check() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make RUN_EXPENSIVE_TESTS=yes check
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  
  cd ${pkgdir}/usr/bin
  install -dm755 ${pkgdir}/{bin,usr/sbin}
  
  # binaries required by FHS
  _fhs=('cat' 'chgrp' 'chmod' 'chown' 'cp' 'date' 'dd' 'df' 'echo' 'false'
        'ln' 'ls' 'mkdir' 'mknod' 'mv' 'pwd' 'rm' 'rmdir' 'stty' 'su' 'sync'
        'true' 'uname')
  mv ${_fhs[@]} ${pkgdir}/bin
  
  # makepkg uses the full path to this...
  ln -s /usr/bin/du ${pkgdir}/bin/du

  mv chroot ${pkgdir}/usr/sbin
  install -Dm644 ${srcdir}/su.pam ${pkgdir}/etc/pam.d/su
}
