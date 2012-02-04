# ureadahead
# Maintainer: ying <Jinoto Systems>
# Contributor: ying <Jinoto Systems>

pkgname=libaudit
pkgver=1.7.13
pkgrel=1
pkgdesc="The audit-libs package contains the dynamic libraries needed for applications to use the audit framework. Needed by readahead-fedora."
arch=('i686' 'x86_64')
url="http://packages.debian.org/en/sid/libaudit0"
install=libaudit.install
depends=('gcc-libs' 'swig')
source=(http://ftp.de.debian.org/debian/pool/main/a/audit/audit_$pkgver.orig.tar.gz http://ftp.de.debian.org/debian/pool/main/a/audit/audit_$pkgver-$pkgrel.diff.gz "ying's_patch_libaudit.patch")
license=('GPL2')

build() {
  cd ${srcdir}/audit-$pkgver
  
  patch -Np1 -i ${srcdir}/audit_$pkgver-$pkgrel.diff
  patch -Np1 -i ${srcdir}/../"ying's_patch_libaudit.patch"

  ./configure
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  mv ${pkgdir}/usr/local/* ${pkgdir}/
  rm -rf ${pkgdir}/usr/local
  mv ${pkgdir}/include ${pkgdir}/usr/include
  rm -rf ${pkgdir}/libexec
  rm -rf ${pkgdir}/share
  rm -rf ${pkgdir}/etc
}


md5sums=('967776cbec046043ef02ffefe0e89cb7'
         '89cc809cb8a24167ac87354712ad2d6c'
         'aeb1d650e9b67745ded34ee9cc733b4d')
