# Contributor: Andreas Wagner <andreas.wagner@em.uni-frankfurt.de>

pkgname=wmswallow
pkgver=0.6.1
pkgrel=1
pkgdesc="Dock any (!) Application into the WindowMaker dock"
arch=(i686 x86_64)
url="http://gpo.zugaina.org/x11-plugins/wmswallow"
license=('GPL')
depends=(libxext)
source=(http://distro.ibiblio.org/amigolinux/download/DockApps/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2)

build() {
#  uncompress wmswallow.tar.Z
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i "s|waitformap(winreturn);|/* waitformap(winreturn); */|g" wmswallow.c
  sed -i "s|X=/usr/X11R6|X=/usr|g" Makefile
  sed -i "s:\${OBJS} -o:\${OBJS} \${LDFLAGS} -o:" Makefile
  make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS} -lX11" xfree
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d ${pkgdir}/usr/bin
  install -Dm755 wmswallow ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/doc/wmswallow
  install -Dm644 README ${pkgdir}/usr/share/doc/wmswallow
}

md5sums=('92aed4c53a65d6fa25bf42cd7175f4c7')
