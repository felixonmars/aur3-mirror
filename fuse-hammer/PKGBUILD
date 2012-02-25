# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=fuse-hammer
pkgver=latest
pkgrel=2
pkgdesc="A FUSE module for the HAMMER filesystem."
arch=(i686 x86_64)
url="https://github.com/dlorch/hammer-linux"
license=('BSD')
depends=('fuse' 'glibc')

build() {
  cd ${srcdir}
  wget "$url/tarball/${pkgname}" -O "${pkgname}.tar.gz"
  bsdtar -xf ${pkgname}.tar.gz
  cd "dlorch-hammer-linux-aeafa62"
  sed 's/LDFLAGS=-lfuse_ino64/LDFLAGS=-lfuse/g' Makefile > Makefile.new
  make -f Makefile.new
}

package() {
  cd "${srcdir}/dlorch-hammer-linux-aeafa62"
  install -Dm755 fusehammer ${pkgdir}/usr/bin/fusehammer
} 
