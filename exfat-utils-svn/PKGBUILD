# Maintainer: Bob Valantin <valantin89 [at] gmail [dot] com>

pkgname=exfat-utils-svn
pkgver=382
pkgrel=1
pkgdesc="Utilities for exFAT file system"
arch=('i686' 'x86_64')
url="http://code.google.com/p/exfat/"
license=('GPL2')
depends=('glibc')
makedepends=('scons' 'subversion')
provides=('exfat-utils')
conflicts=('exfat-utils')
source=("${pkgname}::svn+https://exfat.googlecode.com/svn/trunk/")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  svnversion | tr -d [A-z]
}

package() {
  cd "${srcdir}/${pkgname}"
  rm -r fuse

  scons CCFLAGS="${CFLAGS} -std=c99" LINKFLAGS="${LDFLAGS} " install DESTDIR="${pkgdir}/usr/bin"

  # Install man pages
  install -Dm444 dump/dumpexfat.8 "${pkgdir}/usr/share/man/man8/dumpexfat.8"
  install -m444 fsck/exfatfsck.8 "${pkgdir}/usr/share/man/man8"
  install -m444 mkfs/mkexfatfs.8 "${pkgdir}/usr/share/man/man8"
  install -m444 label/exfatlabel.8 "${pkgdir}/usr/share/man/man8"
}
