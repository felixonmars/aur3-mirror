# $Id: PKGBUILD 182101 2013-04-06 21:59:09Z eric $
# Maintainer: Eric Bélanger <eric@archlinux.org>
# Maintainer: Nicky726 <Nicky726@gmail.com>

pkgname=selinux-psmisc
_origname=psmisc
pkgver=22.20
pkgrel=1
pkgdesc="Miscellaneous procfs tools with SELinux support"
arch=('i686' 'x86_64')
url="http://psmisc.sourceforge.net/index.html"
license=('GPL')
groups=('selinux' 'selinux-system-utilities')
depends=('ncurses' 'selinux-usr-libselinux')
conflicts=("${_origname}")
provides=("${_origname}=${pkgver}-${pkgrel}")
source=(http://downloads.sourceforge.net/psmisc/${_origname}-${pkgver}.tar.gz
        psmisc-22.20-fix-selinux-in-pstree.patch)
sha1sums=('abdddc8d5c91251bba0f3190956ae9d05c058745'
          'ec7bf64a4700c79672e72c321772df1203cb3f99')

build() {
  cd "${srcdir}/${_origname}-${pkgver}"
	patch -Np1 -i ${srcdir}/psmisc-22.20-fix-selinux-in-pstree.patch
  ./configure --prefix=/usr --enable-selinux
  make
}

package() {
  cd "${srcdir}/${_origname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
