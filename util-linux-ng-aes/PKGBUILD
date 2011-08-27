# Contributor: judd <jvinet[at]zeroflux.org>
# Contributor: milomouse <vincent[at]fea.st>

_basename=util-linux-ng
pkgname=${_basename}-aes
pkgver=2.18
pkgrel=4
pkgdesc="Miscellaneous system utilities for Linux, with loop-AES support"
url="http://userweb.kernel.org/~kzak/util-linux-ng/"
license=('GPL2')
arch=('i686' 'x86_64')
groups=('base')
depends=('bash' 'ncurses>=5.7' 'zlib' 'filesystem')
optdepends=('perl: for chkdupexe support')
conflicts=('linux32' 'util-linux' 'util-linux-ng' 'e2fsprogs<1.41.8-2' 'loop-aes-util-linux-ng')
replaces=('linux32' 'util-linux' 'util-linux-ng' 'loop-aes-util-linux-ng')
provides=('linux32' "util-linux=$pkgver-$pkgrel" "util-linux-ng=$pkgver-$pkgrel")
options=('!libtool')
_loopaesdate=20100706
_loopaespatch=${_basename}-${pkgver}-aes-${_loopaesdate}.diff
source=(ftp://ftp.kernel.org/pub/linux/utils/${_basename}/v2.18/${_basename}-${pkgver}.tar.bz2
        fix-findmnt.patch
        util-linux-ng-nilfs2.patch
        util-linux-ng-cfdisk.patch
        util-linux-ng-blkid.patch
        ${_loopaespatch})
install=${pkgname}.install

build() {
  cd "${srcdir}/${_basename}-${pkgver}"
  # hardware clock
  sed -e 's%etc/adjtime%var/lib/hwclock/adjtime%' -i hwclock/hwclock.c
  # fix findmnt
  patch -p1 -i "${srcdir}/fix-findmnt.patch"
  # add nilfs2 support, included in next upstream release
  patch -Np1 -i "${srcdir}/util-linux-ng-nilfs2.patch"
  # fix cfdisk partition changing, included in next upstream release
  patch -Np1 -i "${srcdir}/util-linux-ng-cfdisk.patch"
  # fix some issues with blkid low-level probing that affect current initscripts
  patch -Np1 -i "${srcdir}/util-linux-ng-blkid.patch"
  # provide loop-aes support
  patch -Np1 -i "${srcdir}/${_loopaespatch}"
  autoreconf
  automake
  ./configure --enable-arch --enable-write --enable-raw --disable-wall --enable-rdev --enable-partx
  make HAVE_SLN=yes ADD_RAW=yes
}

package() {
  cd "${srcdir}/${_basename}-${pkgver}"
  mkdir -p "${pkgdir}/var/lib/hwclock"
  make HAVE_SLN=yes ADD_RAW=yes DESTDIR="${pkgdir}" install
  # remove files
  rm -f "${pkgdir}/bin/kill"
  rm -f "${pkgdir}/usr/share/man/man1/kill.1"
  rm -f "${pkgdir}/usr/share/man/man5/nfs.5"
  rm -f "${pkgdir}/usr/share/info/dir"
}

md5sums=(
      '2f5f71e6af969d041d73ab778c141a77'  # util-linux-ng-2.18.tar.bz2
      '7346673932b165faadde2fa2a9c1cd3a'  # fix-findmnt.patch
      'aa1f210aa22363605363b7b14b8f7a78'  # util-linux-ng-nilfs2.patch
      'e6d9309d44c258b25a7fb0b70f94f94e'  # util-linux-ng-cfdisk.patch
      '0e7f8aa87e227fd176cb54435a94c8c5'  # util-linux-ng-blkid.patch
      '5b5e9ebafb843c358621de01676f10cb') # util-linux-ng-2.18-aes-20100706.diff
sha384sums=(
  '560bd7312bf8d17f3ea7f3d098c3f094c01b93eb991f101c074fb2be574795b3973808d2e61acd814640f2fe1e2248c2'  # util-linux-ng-2.18.tar.bz2
  'd4de02ad5033d6b8d4292a419e0a3e74cbd86b25fc5bbcda8e58d451aaf8b2ce97edd0e9f6b11f3e6e58682e09032ff6'  # fix-findmnt.patch
  'b6519430d1d45ddcd6ee1af28f1316529eccbc8d5e5e328cfa4dba8562b424684ed0413005dc3ec1ef4f02af521218f7'  # util-linux-ng-nilfs2.patch
  '7f9733c24e6697b0192818c7ca4c15e26978f7afe97f35e93d11bdaa17bd5f22affa78dc1c1d921daa64b05c4867c736'  # util-linux-ng-cfdisk.patch
  'c3b88405bb68d970f12e2b52c57a5d6999c468ac32ffcc17262d22e2d4111eb83f4178482db562e8d1f8bcedabbabecf'  # util-linux-ng-blkid.patch
  '222f59a47d3c7e9ca2da6f8da0029eaa2d3d9164a278073bd7fac609ad83d89cb919823eb080a42054039ad207b6d6c8') # util-linux-ng-2.18-aes-20100706.diff
