# Maintainer: Adrien RAFFIN <raffinadrien@gmail.com> 

pkgname=coreutils-acp
pkgver=8.20_0.5

_pkgname=coreutils
_pkgver=${pkgver%_*}
_patchver=${pkgver#*_}
pkgrel=3
pkgdesc="The basic file, shell and text manipulation utilities of the GNU operating system"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.gnu.org/software/coreutils"
groups=('base')
depends=('glibc' 'pam' 'acl' 'gmp' 'libcap')
conflicts=('coreutils')
provides=('coreutils')
install=${_pkgname}.install
source=(ftp://ftp.gnu.org/gnu/$_pkgname/$_pkgname-$_pkgver.tar.xz{,.sig}
        advcpmv-$pkgver.patch)
md5sums=('3d69af8f561fce512538a9fe85f147ff'
         '7e6076e4e0961d24c38cf8685efca35b'
         '2869f9d029bc25a1f10397dda5a50efd')

build() {
  cd ${srcdir}/${_pkgname}-${_pkgver}
    
  patch -p1 -i ${srcdir}/advcpmv-${pkgver}.patch

  ./configure --prefix=/usr --libexecdir=/usr/lib \
              --enable-no-install-program=groups,hostname,kill,uptime \
              --enable-pam
  make
}

check() {
  cd ${srcdir}/${_pkgname}-${_pkgver}
  make RUN_EXPENSIVE_TESTS=yes check
}

package() {
  cd ${srcdir}/${_pkgname}-${_pkgver}
  make DESTDIR=${pkgdir} install

  cd ${pkgdir}/usr/bin
  install -dm755 ${pkgdir}/bin

  # binaries required by FHS
  _fhs=('cat' 'chgrp' 'chmod' 'chown' 'cp' 'date' 'dd' 'df' 'echo' 'false'
        'ln' 'ls' 'mkdir' 'mknod' 'mv' 'pwd' 'rm' 'rmdir' 'stty' 'sync'
        'true' 'uname')
  for i in ${_fhs[@]}; do
    ln -s ../usr/bin/$i ${pkgdir}/bin/$i
  done
}
