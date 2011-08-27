# Maintainer: kfgz <kfgz at interia pl>

pkgname=libopenssl2
pkgver=0.9.6b
pkgrel=34
_pkgv=32.7
pkgdesc='The old openssl libraries'
arch=('i686' 'x86_64')
url='http://www.openssl.org'
license=('custom:BSD')
depends=('glibc')
makedepends=('rpmunpack' 'cpio' 'gzip' 'bash')
source=(http://files.directadmin.com/services/7.2/openssl-${pkgver}-${_pkgv}.i386.rpm)
md5sums=('8a9f793cc9fc713551c307072fe718d6')

build() {
  cd ${srcdir}
  
  rpmunpack openssl-${pkgver}-${_pkgv}.i386.rpm
  gzip -d openssl-${pkgver}-${_pkgv}.cpio.gz
}

package() {
  cd ${pkgdir}

  mkdir -p {lib,usr/bin,usr/share/doc/openssl-${pkgver}}
  mkdir -p {usr/share/man/man1,usr/share/ssl/CA,usr/share/ssl/certs}
  mkdir -p {usr/share/ssl/lib,usr/share/ssl/misc,usr/share/man/man5}
  mkdir -p usr/share/man/man7
  cpio -i < ${srcdir}/openssl-${pkgver}-${_pkgv}.cpio

  # Move and delete files and folders
  mkdir -p usr
  mv lib usr
  rm -R {usr/bin,usr/share/man,usr/share/ssl}

  # Add symlink
  ln -s /usr/lib/libssl.so.0.9.6b usr/lib/libssl.so.2
  ln -s /usr/lib/libcrypto.so.0.9.6b usr/lib/libcrypto.so.2
}
