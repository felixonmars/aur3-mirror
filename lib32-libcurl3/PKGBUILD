# $Id$
# Maintainer: webjdm <web.jdm@gmail.org>

pkgname=lib32-libcurl3
pkgname32=libcurl3
pkgver=7.15.5
pkgrel=1
pkgdesc="Old libcurl.so.3 library"
arch=('x86_64')
url="http://curl.haxx.se"
license=('MIT')
depends=('lib32-libopenssl2' 'lib32-zlib')
makedepends=('rpmunpack' 'cpio' 'gzip' 'bash')
source=(http://curl.haxx.se/download/${pkgname32}-${pkgver}-${pkgrel}.i386.rpm)
md5sums=('ff5c4bd95f7d53362229cb6ad0819728')

build() {
  cd ${startdir}/src

  rpmunpack ${pkgname32}-${pkgver}-${pkgrel}.i386.rpm || return 1
  gzip -d ${pkgname32}-${pkgver}-${pkgrel}.cpio.gz || return 1

  cd ${startdir}/pkg

  mkdir -p usr/lib
  mkdir -p usr/share/doc/${pkgname32}-${pkgver}
  cpio -i < ${startdir}/src/${pkgname32}-${pkgver}-${pkgrel}.cpio || return 1

  # Move 32-Bit libcurl3 in /opt
  mkdir -p opt/lib32/usr/
  mv usr/lib opt/lib32/usr/
}
