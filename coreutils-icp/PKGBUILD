# Maintainer: Henrik J. Pedersen <HenrikJuul@gmail.com>
# Contributor: Palle Ravn <Ravnzon@gmail.com>
#
# This package is based on PKGBUILD and .install for coreutils-8.21 by:
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=coreutils-icp
pkgver=8.22
pkgrel=1
_icpVer=2.0
pkgdesc="GNU Coreutils with icp progressbar patch for copy"
arch=('x86_64' 'i686')
license=('GPL3')
url="http://bitbucket.org/henrikjuul/icp"
depends=('glibc' 'pam' 'acl' 'gmp' 'libcap')
provides=('coreutils')
conflicts=('coreutils')
install=${pkgname}.install
source=(http://ftpmirror.gnu.org/coreutils/coreutils-$pkgver.tar.xz
        http://bitbucket.org/henrikjuul/icp/downloads/coreutils-$pkgver-icp-$_icpVer.patch)

build() {
  patch -p1 < coreutils-$pkgver-icp-$_icpVer.patch
  cd ${srcdir}/coreutils-${pkgver}
  
  echo "Running autoreconf, this might take a while..."
  autoreconf --install --force

  ./configure --prefix=/usr --libexecdir=/usr/lib \
              --enable-no-install-program=groups,hostname,kill,uptime 
  make
}

check() {
  cd ${srcdir}/coreutils-${pkgver}
  make check-expensive -j
}

package() {
  cd ${srcdir}/coreutils-${pkgver}
  make DESTDIR=${pkgdir} install

  cd ${pkgdir}/usr/bin
  install -dm755 ${pkgdir}/bin

#  # binaries required by FHS
#  _fhs=('cat' 'chgrp' 'chmod' 'chown' 'cp' 'date' 'dd' 'df' 'echo' 'false'
#        'ln' 'ls' 'mkdir' 'mknod' 'mv' 'pwd' 'rm' 'rmdir' 'stty' 'sync'
#        'true' 'uname')
#  for i in ${_fhs[@]}; do
#    ln -s ../usr/bin/$i ${pkgdir}/bin/$i
#  done
}
md5sums=('8fb0ae2267aa6e728958adc38f8163a2'
         '0b279c8d9a76747294ae0efa39c3cec2')
