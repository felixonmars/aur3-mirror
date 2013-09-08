# Maintainer: Bob Valantin <valantin89 [at] gmail [dot] com>

pkgname=fuse-exfat-svn
pkgver=382
pkgrel=1
pkgdesc="Free exFAT file system implementation"
arch=('i686' 'x86_64')
url="http://code.google.com/p/exfat/"
license=('GPL2')
depends=('fuse')
makedepends=('scons' 'subversion')
optdepends=('exfat-utils-git: utilities for exFAT file system'
            'util-linux: to mount exFAT volumes automatically')
provides=('fuse-exfat')
conflicts=('fuse-exfat')
source=("${pkgname}::svn+https://exfat.googlecode.com/svn/trunk/")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  svnversion | tr -d [A-z]
}

package() {
  cd "${srcdir}/${pkgname}"
  rm -r dump fsck label mkfs

  scons CCFLAGS="${CFLAGS} -std=c99" LINKFLAGS="${LDFLAGS} " install DESTDIR="${pkgdir}/usr/bin"
  
  # Install man page
  install -Dm444 fuse/mount.exfat-fuse.8 "${pkgdir}/usr/share/man/man8/mount.exfat-fuse.8"
}  
