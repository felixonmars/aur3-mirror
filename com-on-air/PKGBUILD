# Contributor: Jens Pranaitis <jens@jenux.homelinux.org>
# Contributor: Thomas Schneider <blacklotus@jenux.homelinux.org>
pkgname=com-on-air
pkgver=22
pkgrel=2
pkgdesc="Com on air linux driver, for dect pcmcia cards."
url="https://dedected.org/cgi-bin/trac.cgi/wiki/COM-ON-AIR-Linux"
arch=('i686' 'x86_64')
license=('GPL2')
depends=()
makedepends=('subversion' 'gcc')
conflicts=()
provides=()
source=()
md5sums=()

_svntrunk=https://dedected.org/svn/trunk/com-on-air_cs-linux
_svnmod=com-on-air_cs-linux

build() {
  cd ${srcdir}
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  cd $_svnmod
  make KERNEL_SOURCES=$_kerndir|| return 1
  mkdir -p ${pkgdir}/lib/modules/`uname -r`/kernel/drivers/pcmcia/
  install com_on_air_cs.ko ${pkgdir}/lib/modules/`uname -r`/kernel/drivers/pcmcia/
}
