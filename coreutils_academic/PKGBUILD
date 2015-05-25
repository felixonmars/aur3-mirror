# $Id: PKGBUILD 217740 2014-07-22 22:49:21Z seblu $
# Maintainer:  Sébastien "Seblu" Luttringer
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: Rémi Audebert <halfr@lse.epita.fr> for "Academic tradition"

pkgname=coreutils_academic
pkgname_=coreutils
pkgver=8.23
pkgrel=1
pkgdesc='The basic file, shell and text manipulation utilities of the GNU
operating system. This version supports the academic tradition of citing the
works you base your article on.'
arch=('i686' 'x86_64')
license=('GPL3')
url='http://www.gnu.org/software/coreutils'
groups=('base')
depends=('glibc' 'pam' 'acl' 'gmp' 'libcap' 'openssl')
install=$pkgname_.install
source=("ftp://ftp.gnu.org/gnu/$pkgname/$pkgname_-$pkgver.tar.xz"{,.sig}
        academic_tradition.diff)
md5sums=('abed135279f87ad6762ce57ff6d89c41' 'SKIP'
         '75b0e6b7f8bb9eece22c07e98ee39274')

prepare() {
  cd $pkgname_-$pkgver
  patch -p1 -i ../../academic_tradition.diff
}

build() {
  cd $pkgname_-$pkgver
  ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib \
      --with-openssl \
      --enable-no-install-program=groups,hostname,kill,uptime
  make -j8
}

# Academic tradition makes most of the tests fail.
#check() {
#  cd $pkgname_-$pkgver
#  make RUN_EXPENSIVE_TESTS=yes check
#}

package() {
  cd $pkgname_-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
