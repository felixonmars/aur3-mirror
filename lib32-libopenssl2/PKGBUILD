# Contributor: webjdm <web.jdm@gmail.org>
# Maintainer: Ray Kohler <ataraxia937@gmail.com>
# Category: lib

pkgname=lib32-libopenssl2
pkgver=0.9.6b
pkgrel=32.7
pkgdesc='The old openssl libraries'
arch=('x86_64')
url='http://www.openssl.org'
license=('custom:BSD')
makedepends=('rpmunpack' 'cpio' 'gzip' 'bash')
source=("ftp://rpmfind.net/linux/freshrpms/redhat/7.0/updates/i686/openssl-${pkgver}-${pkgrel}.i686.rpm")
md5sums=('c68a5311f1aaa36279517de2b942f80f')

build() {
  cd ${startdir}/src

  rpmunpack openssl-${pkgver}-${pkgrel}.i686.rpm || return 1
  gzip -d openssl-${pkgver}-${pkgrel}.cpio.gz || return 1

  cd ${startdir}/pkg

  mkdir -p {lib,usr/bin,usr/share/doc/openssl-${pkgver},usr/share/man/man1,usr/share/ssl/CA,usr/share/ssl/certs,usr/share/ssl/lib,usr/share/ssl/misc,usr/share/man/man5,usr/share/man/man7}
  cpio -i < ${startdir}/src/openssl-${pkgver}-${pkgrel}.cpio || return 1

  # Move and delete files and folders
  mkdir -p opt/lib32/usr
  mv lib opt/lib32/usr
  rm -R {usr/bin,usr/share/man,usr/share/ssl}

  # Add symlink
  ln -s /opt/lib32/usr/lib/libssl.so.0.9.6b opt/lib32/usr/lib/libssl.so.2
  ln -s /opt/lib32/usr/lib/libcrypto.so.0.9.6b opt/lib32/usr/lib/libcrypto.so.2
}
