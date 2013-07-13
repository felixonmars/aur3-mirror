# Maintainer: Archan Paul <archan.paul@gmail.com>
# Contributor: aexoxea <digitaleon@internode.on.net>

pkgname=idle3-tools
pkgver=0.9.1
pkgrel=2
pkgdesc="A linux/unix utility that can disable, get and set the value of the idle3 timer found on recent Western Digital Hard Disk Drives."
arch=('i686' 'x86_64')
url="http://idle3-tools.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=("http://download.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tgz" arch-usrbin-makefile-fix.diff)
md5sums=('797d8775b80b7b7b67a1f8b0a5b41f30' 'a2d3805f45991bbb77c1acc157e00822')

build() {
  # Patch Makefile per ArchLinux /usr/bin consolidation of June 2013
  # https://bbs.archlinux.org/viewtopic.php?id=164790
  patch -Np1 -i ${srcdir}/arch-usrbin-makefile-fix.diff

  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make PREFIX=/usr MANDIR=/usr/share/man DESTDIR=${pkgdir} install
}
