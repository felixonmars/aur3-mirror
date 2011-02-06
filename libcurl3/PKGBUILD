# $Id$
# Maintainer: webjdm <web.jdm@gmail.org>

pkgname=libcurl3
pkgver=7.15.5
pkgrel=1
pkgdesc="Old libcurl.so.3 library"
arch=('i686')
url="http://curl.haxx.se"
license=('MIT')
depends=('libopenssl2' 'zlib')
makedepends=('rpmunpack' 'cpio' 'gzip' 'bash')
source=(http://curl.haxx.se/download/${pkgname}-${pkgver}-${pkgrel}.i386.rpm)
md5sums=('ff5c4bd95f7d53362229cb6ad0819728')

build() {
  cd ${startdir}/src

  rpmunpack ${pkgname}-${pkgver}-${pkgrel}.i386.rpm || return 1
  gzip -d ${pkgname}-${pkgver}-${pkgrel}.cpio.gz || return 1

  cd ${startdir}/pkg

  mkdir -p usr/lib
  mkdir -p usr/share/doc/${pkgname}-${pkgver}
  cpio -i < ${startdir}/src/${pkgname}-${pkgver}-${pkgrel}.cpio || return 1
}
