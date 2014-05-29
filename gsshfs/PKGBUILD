# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Maintainer: Funkin-Stoopid <>
# Contributor: Funkin-Stoopid <>
pkgname=gsshfs
pkgver=1.0.6
pkgrel=2
pkgdesc="GUI for SSHFS"
arch=('i686' 'x86_64')
url="http://sallu.tuxfamily.org/-Home-"
license=('GPL')
#groups=
#provides=
depends=('gtk2' 'fuse' 'sshfs')
makedepends=('cmake' 'make')
#conflicts=()
#replaces=()
#backup=()
#install=()
source=(http://sallu.tuxfamily.org/IMG/bz2/${pkgname}-${pkgver}.tar.bz2)
md5sums=('8a7d36dcc63ede7da26d2ffeeea7ca45')
build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make || return 1
}
package()
{
 cd "${srcdir}/${pkgname}-${pkgver}"
 make DESTDIR=$pkgdir install
 mv ${pkgdir}/usr/doc/ ${pkgdir}/usr/share/doc/
}
