# $Id: PKGBUILD 166683 2012-09-15 15:22:53Z allan $
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=make-webkit-patched
conflicts=make
provides=make
pkgver=3.82
pkgrel=p0.5
pkgdesc="GNU make utility to maintain groups of programs - with patched needed to build WebKitGTK+"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/make"
license=('GPL3')
groups=('base-devel')
depends=('glibc' 'sh')
install=$provides.install
source=(ftp://ftp.gnu.org/gnu/${provides}/${provides}-${pkgver}.tar.bz2{,.sig}
        make-3.82-bug30612.patch
        make-3.82-bug30723.patch
        make-3.82-sort-blank.patch
        make-3.82-makeflags.patch
        make-3.82-expensive_glob.patch
        make-3.82-dont-prune-intermediate.patch
				make-3.82-arg-list-length.patch
				make-3.82-parallel-build.patch)
md5sums=('1a11100f3c63fcf5753818e59d63088f'
         'c78daf24f4ec5900c8f81e89a6e1cd5a'
         'c8f496b22191f9fb9420ab14c1a19a47'
         '662e6450e19a5acdaa5c9fcb8ad78dea'
         '7d01a99f389d8f08dec93ed479071ee4'
         'bc12ad4d0c6e6c0e72d9fb61054f446b'
         'e58d4211c5b29d7d927a304d082849e7'
         '45ac9e987f4bf16c0d7e1685db943917'
         'aeb53e4376634e06864ba125b87b7449'
         '908e95681219c9f3f63e633b86bda4e7')


build() {
  cd ${srcdir}/${provides}-${pkgver}

	# WebKit patches (from Tools/gtk/patches/)
	patch -Np1 -i $srcdir/make-3.82-parallel-build.patch
	patch -Np1 -i $srcdir/make-3.82-arg-list-length.patch

  # http://savannah.gnu.org/bugs/?30612
  patch -Np1 -i $srcdir/make-3.82-bug30612.patch

  # http://savannah.gnu.org/bugs/?30723
  patch -Np1 -i $srcdir/make-3.82-bug30723.patch

  # https://bugs.archlinux.org/task/22733 (fix from Fedora)
  patch -Np1 -i $srcdir/make-3.82-sort-blank.patch

  # https://savannah.gnu.org/bugs/?33873
  patch -Np0 -i $srcdir/make-3.82-makeflags.patch

  # http://lists.gnu.org/archive/html/bug-make/2011-04/msg00002.html
  patch -Np0 -i $srcdir/make-3.82-expensive_glob.patch

  # https://savannah.gnu.org/bugs/?30653
  patch -Np0 -i $srcdir/make-3.82-dont-prune-intermediate.patch

  ./configure --prefix=/usr
  make
}

check() {
  cd ${srcdir}/${provides}-${pkgver}
  make check
}

package() {
  cd ${srcdir}/${provides}-${pkgver}
  make DESTDIR=${pkgdir} install
}
