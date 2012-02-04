# Maintainer: Max Roder <maxroder@web.de>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname='libhx'
pkgver='3.12.1'
pkgrel='1'
pkgdesc='A library providing queue, tree, I/O and utility functions'
arch=('i686' 'x86_64')
url=('http://libhx.sourceforge.net/')
license=('GPL')
depends=('glibc')
options=('!libtool' '!docs')
source=("http://downloads.sourceforge.net/${pkgname}/libHX-${pkgver}.tar.xz")
sha256sums=('15476e7a8ea6fb30da16fe0516a7e6ab94f3f5d367f773579e2fa47be6f7a73c')

build()
{
  cd ${srcdir}/libHX-${pkgver}

  ./configure --prefix=/usr
  make
}

package()
{
  cd ${srcdir}/libHX-${pkgver}
	
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
