# $Id: PKGBUILD 187020 2013-06-03 11:14:56Z allan $
# Maintainer: Allan McRae <allan@archlinux.org>
# Maintainer: Nicky726 <Nicky726@gmail.com>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=selinux-coreutils
_origname=coreutils
pkgver=8.21
pkgrel=2
pkgdesc="SELinux aware basic file, shell and text manipulation utilities of the GNU operating system"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.gnu.org/software/coreutils"
groups=('selinux' 'selinux-system-utilities')
depends=('glibc' 'selinux-pam' 'acl' 'gmp' 'libcap' 'selinux-usr-libselinux')
conflicts=("${_origname}")
provides=("${_origname}=${pkgver}-${pkgrel}")
replaces=('mktemp')
backup=('etc/pam.d/su')
install=${_origname}.install
options=('!emptydirs')
source=(ftp://ftp.gnu.org/gnu/$_origname/$_origname-$pkgver.tar.xz{,.sig})
md5sums=('065ba41828644eca5dd8163446de5d64'
         'SKIP')

build() {
  cd ${srcdir}/${_origname}-${pkgver}

  ./configure --prefix=/usr --libexecdir=/usr/lib \
              --enable-no-install-program=groups,hostname,kill,uptime
  make
}

check() {
  cd ${srcdir}/${_origname}-${pkgver}
  make RUN_EXPENSIVE_TESTS=yes check
}

package() {
  cd ${srcdir}/${_origname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
